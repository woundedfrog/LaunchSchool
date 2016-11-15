VALID_CHOICES = %w(r p s l sp)

CHOICE_NAMES = { "r" => "Rock",
                 "p" => "Paper",
                 "s" => "Scissors",
                 "l" => "Lizard",
                 "sp" => "Spock" }

COMBOS = {
  'r' => %w(s l),
  'p' => %w(r sp),
  's' => %w(p l),
  'l' => %w(sp p),
  'sp' => %w(r s)
}

def test_method
  prompt("Testing!")
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
   COMBOS[first].include?(second)
end

test_method

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
    prompt("You've managed to beat the computer. Congratulations!")
  elsif win?(computer, player)
    prompt("Computer won!")
    prompt("How could you let this happen?")
  end
end

def score_counter(player_score, computer_score)
  if player_score > computer_score
    prompt("You are winning! Player: #{player_score} **** Computer: #{computer_score}")
  elsif computer_score > player_score
    prompt("You are losing! Player: #{player_score} **** Computer: #{computer_score}")
  else
    prompt("You are tied! Player: #{player_score} **** Computer: #{computer_score}")
  end
end

player_score = 0
computer_score = 0

def break_loop 
     prompt("Do you want to play again?('y' or 'n')")
    answer = Kernel.gets().chomp()
    player_score = 0
  computer_score = 0
end

loop do  
  
  choice = ''
  loop do
      choice_prompt = <<-MSG
  Make a choice:
  r  ----> Rock
  p  ----> Paper
  s  ----> Scissors
  l  ----> Lizard
  sp ----> Spock
MSG

  prompt(choice_prompt)

    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{CHOICE_NAMES[choice]} **** Computer chose: #{CHOICE_NAMES[computer_choice]}")

  
  if win?(choice, computer_choice)
    player_score += 1
    score_counter(player_score, computer_score)
  elsif win?(computer_choice, choice)
    computer_score += 1
    score_counter(player_score, computer_score)
  else
    score_counter(player_score, computer_score)
  end
  
  answer = ''
  if player_score == 5
  display_results(choice, computer_choice)
    break_loop
    elsif computer_score == 5
  display_results(choice, computer_choice)
    break_loop
    elsif player_score == 5 && computer_score == 5
    prompt("It's a tie!")
    prompt("Well, try harder next time!")
    break_loop
  end
  
#   prompt("Do you want to play again?")
#  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
    
#    
end


prompt("Thank you for playing!")
