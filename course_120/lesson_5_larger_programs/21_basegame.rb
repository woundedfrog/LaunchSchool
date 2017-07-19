require 'pry'
class String
  def yellow;         "\033[33m#{self}\033[0m" end
  def cyan;           "\033[36m#{self}\033[0m" end
  def red;            "\e[41m#{self}\e[0m" end
end

module Displayable
  def bannerize(*message)
    puts(("=" * 80).cyan)
    center_message(*message)
    puts(("=" * 80).cyan)
  end

  def center_message(*message)
    message.each do |line|
      size = 40 - (line.size / 2)
      size = 0 if size < 0
      #binding.pry
      
      puts " " * size + line
    end
  end

  def colorize_yellow(string)
    puts string.center(80).yellow
  end

  def continue?(string)
    puts string.center(80).red
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
    #participants = ['Player:'.cyan, ':Dealer'.red]
    #player_names = [player.name, dealer.name]
    bannerize("#{'Player:'.yellow} #{player.name} #{'vs'.yellow} #{dealer.name} #{':Dealer'.yellow}")
  end

  def display_hands_and_totals
    
  end

  def display_total
    
  end

  def clear_screen
    (system 'clear') || (system 'cls')
  end
end

class Participant
  include Displayable

  attr_reader :cards, :name

  def initialize
    @cards = []
    @name = set_name
  end

  def add_card(new_card)
    self.cards << new_card
  end

  def hit
  end

  def stay
  end

  def busted?
    total > 21
  end

  def total
    total = 0
    cards.each do |card|
      card = card.face
      if card == "Ace"
        total += 11
      elsif ["Jack", "Queen", "King"].include?(card)
        total += 10
      else
        total += card.to_i
      end
    end
    total
    #if total > 21 && cards include "ACE" total -= 10
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
    puts "Please enter your name.".yellow
    loop do
      answer = gets.chomp.capitalize
      return answer if answer != ''
      puts "I'm sorry, that's not a valid name!".yellow
    end
  end

  def show_initial_cards
    show_hand
  end
end

class Dealer < Participant
  DEALER_NAMES = ["Louise", "Hergé", "Maurice"]
  
  def deal
    # does the dealer or the deck deal?
  end

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
    puts "#{player.name}'s turn..."
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
        player.show_hand
        break if player.busted?
      end
    end
  end

  def dealer_turn
    
  end

  def show_cards
    puts "#{name}'s hand:"
    cards.each do |card|
      puts "=> #{card}"
    end
    puts "=> Total: #{total}\n"
  end

  def deal_cards
    2.times do
      player.add_card(deck.deal)
      dealer.add_card(deck.deal)
    end
  end

  def show_cards
    player.show_initial_cards
    dealer.show_initial_cards
  end

  def show_busted
    if player.busted?
      puts "Player: #{player.name} busted! The house wins!"
    elsif dealer.busted?
      puts "House: #{dealer.name} busted! #{player.name} wins!"
    end
  end

  def new_game
    
    
  end

  def reset_game
    self.deck = Deck.new
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
      show_cards
      player_turn
      if player.busted?
        show_busted
        break
      end
      dealer_turn
      if player.busted?
        show_busted
        break
      end
      puts 'passed test and breaking...'
      break
      show_result
    end
    display_goodbye_message
  end
end

game = TwentyOne.new
game.start