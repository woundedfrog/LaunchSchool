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
    bannerize("Welcome to Go Fish! Have fun.")
  end

  def display_goodbye_message
    bannerize("Thank you for playing, Sir!")
  end

  def display_players_scores(players)
    puts yellow("Scores").center(80)
    puts "Human: #{players.first.score} - #{players.last.score} :Computer".center(80)
    puts cyan("=" * 40).center(90)
  end

  def display_players_banner(human, computer, current_player)
    clear_screen
    bannerize("#{yellow('Player:')} #{human.name}" \
              " #{yellow('vs')} #{computer.name} #{yellow(':Computer')}\n",
              " Current player: #{current_player.name}")

  end

  def clear_screen
    (system 'clear') || (system 'cls')
  end
end

class Card
  attr_reader :face, :suit

  SUITS = ['♥', '♦', '♠', '♣']
  FACES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  def initialize(suit, face)
    @suit = suit
    @face = face
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    initialize_deck
  end

  def initialize_deck
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        @cards << Card.new(suit, face)
      end
    end
    shuffle!
  end

  def shuffle!
    @cards.shuffle!
  end
end

class Player
  attr_reader :hand, :score, :name

  def initialize(deck)
    @name = set_name
    @score = 0
    @hand = initialize_hand(deck)
  end

  def initialize_hand(deck)
    cards = []
    5.times do
      cards << deck.cards.pop
    end
    cards.sort_by(&:face)
  end

  def draw_from_deck(player1, deck)
    popped_card = deck.cards.pop
    puts "Player picked up #{popped_card.face}" if !player1.instance_of?(Computer)
    player1.hand << popped_card
    player1.sort_hand
    popped_card.face
  end

  def ask_for_card
    answer = nil
    loop do
      puts "Please enter a card face value: (2...J, Q, K, A)"
      answer = gets.chomp.upcase
      if @hand.map(&:face).any? { |card| card == answer }
        break
      end
      puts "Please choose card ranks that you currently have."
    end
    answer
  end

  def check_hand_for_card(card_face)
    return true if @hand.map(&:face).any? { |card| card == card_face }
    false
  end

  def found_card_set?
    @hand.map(&:face).each do |val|
      if @hand.map(&:face).count(val) >= 4
        return true
      end
    end
    false
  end

  def update_score
    @score += 1
  end

  def remove_card(card)
    @hand.map! do |current_card|
      current_card if current_card.face != card
    end.compact!
  end

  def add_card(player2, card)
    player2.each do |card_val|
      @hand << card_val if card_val.face == card
    end
    sort_hand
  end

  def sort_hand
    @hand.sort_by!(&:face)
  end
end

class Human < Player
  def set_name
    answer = nil
    loop do
      puts "Please enter a name with 4 characters or more."
      answer = gets.chomp.capitalize
      break if answer.size >= 4
      puts "That is not a valid input."
    end
    answer
  end
end

class Computer < Player
  def set_name
    ["Timmy", "Mr. Bigglesworth", "Bob"].sample
  end

  def ask_for_card
    @hand.map(&:face).sample
  end
end

class GoFishGame
  include Displayable

  def initialize
    display_welcome_message
    @deck = Deck.new
    @players = [@human = Human.new(@deck), @computer = Computer.new(@deck)]
    @current_players = @players.clone
  end

  def start
    loop do
      display_players_banner(@players.first, @players.last, @current_players.first)
      display_players_scores(@players)
      player1 = @current_players.first
      player2 = @current_players.last
      show_hand
      card = player1.ask_for_card
      if player2.check_hand_for_card(card)
        puts "player 2 has a matching card"
        sleep 1
        exchange_cards(player1, player2, card)
      else
        puts "Player went fishing."
        sleep 1
        go_fish(player1, @deck)
        sleep 2
      end
      while player1.found_card_set?
          card_set_value = return_set_value(player1)
          adjust_score(player1, card_set_value)
        end
      break if @deck.cards.empty? && player1.hand.empy? && player2.hand.empty?
      @current_players.reverse!
      break if player1.score >= 4 || player2.score >= 4
    end
    display_goodbye_message
  end

  def show_hand
    puts "human player:"
    format_cards_display(@players.first.hand)
    puts ""
  end


  def format_cards_display(cards)
    lines_hash = { top: [], mid1: [], mid2: [], mid3: [], bott: [] }
    lines_hash2 = { top: [], mid1: [], mid2: [], mid3: [], bott: [] }
    cards[0..11].each do |card|
      face = card.face
      face = card.face[0] if ["Ace", "Jack", "Queen", "King"].include?(face)
      create_cards_visuals(lines_hash, card, face)
    end
    if cards.size > 12
      cards[12..-1].each do |card|
        face = card.face
        face = card.face[0] if ["Ace", "Jack", "Queen", "King"].include?(face)
        create_cards_visuals(lines_hash_2, card, face)
      end
    end
    print_formated_cards(lines_hash)
    print_formated_cards(lines_hash2) if cards.size > 12
  end

  def create_cards_visuals(lines_hash, card, face)
    spacing = " " * (3 - face.size)
    lines_hash[:top] << " ___ "
    lines_hash[:mid1] << "|" + spacing + "#{face}|"
    lines_hash[:mid2] << "| #{card.suit} |"
    lines_hash[:mid3] << "|#{face}" + spacing + "|"
    lines_hash[:bott] << " ‾‾‾ "
  end

  def print_formated_cards(lines_hash)
    lines_hash.values.each { |value| puts value.join(" ") }
  end

  def exchange_cards(player1, player2, card)
    player1.add_card(player2.hand, card)
    player2.remove_card(card)
  end

  def go_fish(player1, deck)
    player1.draw_from_deck(player1, deck)
  end

  def return_set_value(player1)
    face_values = player1.hand.map(&:face)
    face_values.each do |face|
      if face_values.count(face) >= 4
        return face
      end
    end
  end

  def adjust_score(player1, card)
    player1.update_score
    player1.remove_card(card)
  end
end

new_game = GoFishGame.new
new_game.start
