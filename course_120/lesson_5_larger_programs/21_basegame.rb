require 'pry'
########################################
#          DISPLAY MESSAGES
########################################

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
    bannerize("#{yellow('Player:')} #{player.name}" \
               " #{yellow('vs')} #{dealer.name} #{yellow(':Dealer')}")
  end

  def display_new_game
    bannerize("Let's start a new game!")
  end

  def clear_screen
    (system 'clear') || (system 'cls')
  end
end

########################################
#          Participant Class
########################################

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
    total = adjust_total(total, cards) if total > 21
    total
  end

  def adjust_total(total, cards)
    count = cards.map(&:face).count("Ace")
    loop do
      break if total <= 21 || count == 0
      total -= 10
      count -= 1
    end
    total
  end

  def show_hand
    puts yellow("---- #{name}'s Hand ----")
    format_cards_display(@cards)
    puts "=> Total: #{total}"
    puts ""
  end

  private

  def format_cards_display(cards)
    top = []
    mid1 = []
    mid2 = []
    mid3 = []
    bott = []
    cards.each do |card|
      face = card.face
      face = card.face[0] if ["Ace", "Jack", "Queen", "King"].include?(face)
      top << " ___ "
      mid1 << "|" + (" " * (3 - face.size)) + "#{face}|"
      mid2 << "| #{card.suit} |"
      mid3 << "|#{face}" + (" " * (3 - face.size)) + "|"
      bott << " ‾‾‾ "
    end
    print_formated_cards(top, mid1, mid2, mid3, bott)
  end

  def print_formated_cards(*card_parts)
    card_parts.each { |parts| puts parts.join(" ") }
  end
end

########################################
#          Player Class
########################################

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

########################################
#          Dealer Class
########################################

class Dealer < Participant
  DEALER_NAMES = ["Louise", "Hergé", "Maurice"]

  def set_name
    DEALER_NAMES.sample
  end

  def show_initial_cards
    puts yellow("---- #{name}'s Hand ----")
    cards.take(cards.size - 1).each do |card|
      c_face = card.face[0] if card.face.class == String
      puts [[" ___ "],
            ["|  #{c_face}|"],
            ["| #{card.suit} |   ??"],
            ["|#{c_face}  |"],
            [" ‾‾‾ "]]
    end
    puts "=> Total: ??\n"
  end
end

########################################
#          Card Class
########################################

class Card
  attr_reader :suit

  SUITS = ['♥', '♦', '♠', '♣']
  FACES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  def initialize(suit, face)
    @suit = suit
    @face = face
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
end

########################################
#          Deck Class
########################################

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

########################################
#          GameRound module
########################################

module GameRound
  private

  def current_player_turn
    if @current_player[0].instance_of?(Player)
      player_turn
    else
      dealer_turn
    end
  end

  def player_turn
    loop do
      puts "It's your turn..."
      puts red("\nWould you like to hit or stay? (h/s)")
      answer = nil
      loop do
        answer = gets.chomp.downcase
        break if ['h', 's'].include?(answer)
        puts "Sorry that's not a valid option!"
      end
      break if answer == 's'
      @player.add_card(deck.deal)
      show_turn_hands
      break if @player.busted?
    end
  end

  def dealer_turn
    loop do
      show_turn_hands(true)
      puts "#{dealer.name}'s turn..."
      break if @dealer.busted?
      if @dealer.total >= 17 && !@dealer.busted? &&
         @dealer.total >= @player.total
        break if dealer_stays
      else
        dealer_hits
      end
    end
  end

  def dealer_stays
    puts yellow("#{dealer.name} stays!")
    sleep 1.5
    true
  end

  def dealer_hits
    puts yellow("#{dealer.name} hits!")
    sleep 1.5
    dealer.add_card(deck.deal)
  end
end

########################################
#          GameEngine Class
########################################

class GameEngine
  private

  def show_turn_hands(final = false)
    display_players_banner
    if final
      player.show_hand
      dealer.show_hand
    else
      player.show_initial_cards
      dealer.show_initial_cards
    end
    puts(cyan("=" * 80))
  end

  def deal_cards
    2.times do
      player.add_card(deck.deal)
      dealer.add_card(deck.deal)
    end
  end

  def show_busted
    if player.busted?
      puts yellow("Player: #{player.name} busted! The house wins!")
    elsif dealer.busted?
      puts yellow("House: #{dealer.name} busted! #{player.name} wins!")
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
    elsif player_total == dealer_total
      puts "It's a tie!"
    end
  end

  def detect_busted(player)
    if player.busted?
      show_busted
      return true
    end
    false
  end

  def reset_game
    self.deck = Deck.new
    player.cards = []
    dealer.cards = []
    @current_player = [player, dealer]
    display_new_game
    continue?("Press Enter to continue!")
  end

  def new_game?
    puts bannerize("Do you wish to play again? (y/n)")
    loop do
      answer = gets.chomp.downcase
      if ['y', 'n'].include?(answer)
        return true if answer == 'y'
        return false
      end
      puts "Sorry that's not a valid option!"
    end
  end
end

########################################
#          TwentyOneGame Class
########################################

class TwentyOneGame < GameEngine
  include GameRound
  include Displayable

  attr_accessor :deck, :player, :dealer

  ROUND_LIMIT = 3

  def initialize
    display_welcome_message
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
    @current_player = [player, dealer]
  end

  def start
    round = 0
    loop do
      round += 1
      game_main_loop
      if round == ROUND_LIMIT
        break unless new_game?
        round = 0
      end
      reset_game
    end
    display_goodbye_message
  end

  private

  def game_main_loop
    display_players_banner
    deal_cards
    show_turn_hands(false)
    2.times do
      current_player_turn
      return if detect_busted(@current_player[0])
      @current_player.reverse!
    end
    show_result
  end
end

game = TwentyOneGame.new
game.start
