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

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(key, value)
  COMBOS[key].include?(value)
end

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
    prompt("You are winning! Player: #{player_score} ** Computer: #{computer_score}")
  elsif computer_score > player_score
    prompt("You are losing! Player: #{player_score} ** Computer: #{computer_score}")
  else
    prompt("You are tied! Player: #{player_score} ** Computer: #{computer_score}")
  end
end

scores = { player_score: 0, computer_score: 0 }

def score_increment(hash_to_mutate, key_to_mutate)
  hash_to_mutate[key_to_mutate] += 1
end

def reset_scores(scores)
#  scores[:player_score] = 0
#  scores[:computer_score] = 0
  scores.update(scores) { 0 }
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

  prompt("You chose: #{CHOICE_NAMES[choice]} ** Computer chose: #{CHOICE_NAMES[computer_choice]}")

  if win?(choice, computer_choice)
    score_increment(scores, :player_score)
  elsif win?(computer_choice, choice)
    score_increment(scores, :computer_score)
  end
  score_counter(scores[:player_score], scores[:computer_score])

  if scores[:player_score] == 5 || scores[:computer_score] == 5
    display_results(choice, computer_choice)
    reset_scores(scores)
  end

  answer = ''
  loop do
    prompt("Play_agian?('y' or 'n')")
    answer = gets.chomp
    break if answer.casecmp('y') || answer.casecmp('n')
    prompt("That's not a valid answer")
  end
  break if answer == 'n'
end

prompt("Thank you for playing!")
