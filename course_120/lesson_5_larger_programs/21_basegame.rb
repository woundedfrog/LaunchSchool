require 'pry'

module Displayable
  def bannerize(*message)
    puts(cyan("=" * 80))
    center_message(*message)
    puts(cyan("=" * 80))
  end

  def center_message(*message)
    message.each do |line|
      line_size = line.gsub(/\e\[\d+\m/, "").size
      size = 40 - (line_size / 2)
      size = 0 if size < 0
      puts " " * size + line
    end
  end

  def colorize_yellow(string)
    puts yellow(string.center(80))
  end

  def yellow(string)
    "\033[33m#{string}\033[0m"
  end

  def cyan(string)
    "\033[36m#{string}\033[0m"
  end

  def red(string)
    "\e[41m#{string}\e[0m"
  end

  def continue?(string)
    puts red(string.center(80))
    gets
  end

  def display_welcome_message
    clear_screen
    bannerize("Good evening Sir! Welcome to BlackJack")
  end

  def display_goodbye_message
    bannerize("Thank you for playing, Sir!")
  end

  def display_players_banner
    clear_screen
    bannerize("#{yellow('Player:')} #{player.name} #{yellow('vs')} #{dealer.name} #{yellow(':Dealer')}")
  end

  def display_new_game
    bannerize("Let's start a new game!")
  end

  def clear_screen
    (system 'clear') || (system 'cls')
  end
end

class Participant
  include Displayable

  attr_accessor :cards
  attr_reader :name

  def initialize
    @cards = []
    @name = set_name
  end

  def add_card(new_card)
    cards << new_card
  end

  def busted?
    total > 21
  end

  def total
    total = 0
    cards.each do |card|
      card = card.face
      total += if card == "Ace"
                 11
               elsif ["Jack", "Queen", "King"].include?(card)
                 10
               else
                 card.to_i
               end
    end
    if total > 21
      count = cards.map(&:face).count("Ace")
      loop do
        break if total <= 21 || count == 0
        total -= 10
        count -= 1
      end
    end
    total
  end

  def show_hand
    puts "---- #{name}'s Hand ----"
    cards.each do |card|
      puts "=> #{card}"
    end
    puts "=> Total: #{total}"
    puts ""
  end
end

class Player < Participant
  def set_name
    puts yellow("Please enter your name.")
    loop do
      answer = gets.chomp.capitalize
      return answer if answer != ''
      puts yellow("I'm sorry, that's not a valid name!")
    end
  end

  def show_initial_cards
    show_hand
  end
end

class Dealer < Participant
  DEALER_NAMES = ["Louise", "Hergé", "Maurice"]

  def set_name
    DEALER_NAMES.sample
  end

  def show_initial_cards
    puts "---- #{name}'s Hand ----"
    cards.take(cards.size - 1).each do |cards|
      puts "=> #{cards}"
    end
    puts "=> ?? "
    puts "=> Total: ??"
    puts ""
  end
end

class Card
  SUITS = ['♥', '♦', '♠', '♣']
  FACES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def suit
    case @suit
    when '♥' then '♥'
    when '♦' then '♦'
    when '♠' then '♠'
    when '♣' then '♣'
    end
  end

  def face
    case @face
    when "J" then "Jack"
    when "Q" then "Queen"
    when "K" then "King"
    when "A" then "Ace"
    else
      @face
    end
  end

  def to_s
    "The #{suit}#{face}"
  end
end

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        @cards << Card.new(suit, face)
      end
    end
    shuffle!
  end

  def deal
    cards.pop
  end

  def shuffle!
    @cards.shuffle!
  end
end

module GameMechanic
  def player_turn
    puts "It's your turn..."
    loop do
      puts "Would you like to hit or stay? (h/s)"
      answer = nil
      loop do
        answer = gets.chomp.downcase
        break if ['h', 's'].include?(answer)
        puts "Sorry that's not a valid option!"
      end
      if answer == 's'
        puts "#{player.name} stays!"
        break
      elsif player.busted?
        break
      else
        player.add_card(deck.deal)
        display_players_banner
        puts "#{player.name} hits!"
        show_turn_hands
        break if player.busted?
      end
    end
  end

  def dealer_turn
    puts "#{dealer.name}'s turn..."
    loop do
      if dealer.total >= 17 && !dealer.busted?
        puts "#{dealer.name} stays!"
        break
      elsif dealer.busted?
        break
      else
        puts "#{dealer.name} hits!"
        dealer.add_card(deck.deal)
        show_turn_hands
      end
    end
  end

  def show_turn_hands(final = false)
    display_players_banner
    if final
      player.show_hand
      dealer.show_hand
    else
      player.show_initial_cards
      dealer.show_initial_cards
    end
    bannerize(" ")
  end

  def deal_cards
    2.times do
      player.add_card(deck.deal)
      dealer.add_card(deck.deal)
    end
  end

  def show_busted
    if player.busted?
      puts "Player: #{player.name} busted! The house wins!"
    elsif dealer.busted?
      puts "House: #{dealer.name} busted! #{player.name} wins!"
    end
  end

  def new_game?
    puts "Do you wish to play again? (y/n)"
    loop do
      answer = gets.chomp.downcase
      if ['y', 'n'].include?(answer)
        return true if answer == 'y'
        return false
      end
      puts "Sorry that's not a valid option!"
    end
  end

  def show_result
    player_total = player.total
    dealer_total = dealer.total
    show_turn_hands(true)
    if player_total > dealer_total
      puts "It looks like #{player.name} wins!"
    elsif player_total < dealer_total
      puts "It looks like #{dealer.name} wins!"
    else
      puts "It's a tie!"
    end
  end

  def reset_game
    self.deck = Deck.new
    player.cards = []
    dealer.cards = []
    display_new_game
    continue?("Press Enter to continue!")
  end
end

class TwentyOne
  include GameMechanic
  include Displayable

  attr_accessor :deck, :player, :dealer

  def initialize
    display_welcome_message
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    loop do
      display_players_banner
      deal_cards
      show_turn_hands(false)
      player_turn
      if player.busted?
        show_busted
        break
      end
      dealer_turn
      if dealer.busted?
        show_busted
        break
      end
      show_result
      break unless new_game?
      reset_game
    end
    display_goodbye_message
  end
end

game = TwentyOne.new
game.start
