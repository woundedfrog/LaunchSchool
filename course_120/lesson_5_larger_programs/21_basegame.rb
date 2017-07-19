class String
  def yellow;         "\033[33m#{self}\033[0m" end
  def cyan;           "\033[36m#{self}\033[0m" end
  def red;            "\e[41m#{self}\e[0m" end
end

class Player < Participant
  def set_name
    loop do
      colorize_yellow("Please enter your name.")
      answer = gets.chomp.capitalize
      return answer if !answer.nil?
      colorize_yellow("I'm sorry, that's not a valid name!")
    end
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
end

class Participant
  include Displayable

  def initialize
    @cards = []
    @name = set_name
  end

  def hit
  end

  def stay
  end

  def busted?
  end

  def total
    # definitely looks like we need to know about "cards" to produce some total
  end
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

  def welcome_message
    colorize_yellow("Good evening Sir! Welcome to BlackJack")
  end

  def goodbye_message
    colorize_yellow("Thank you for playing, Sir!")
  end

  def display_hands_and_totals
    
  end

  def display_total
    
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
    # does the dealer or the deck deal?
  end

  def suffle!
    @cards.shuffle!
  end
end

module Game
  def new_game?

  end

  def reset_game
    self.deck = Deck.new
  end
end

class TwentyOne
  include Game

  attr_accessor :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    loop do
      deal_cards
      show_initial_cards
      player_turn
      dealer_turn
      show_result
    end
  end
end

class Card
  SUITS = ['♥', '♦', '♠', '♣']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def face
    case @face
    when '♥' then '♥'
    when '♦' then '♦'
    when '♠' then '♠'
    when '♣' then '♣'
    end
    end

  def suit
    case @suit
    when "J" then "Jack"
    when "Q" then "Queen"
    when "K" then "King"
    when "A" then "Ace"
    end
    end
end

game = TwentyOne.new
game.start