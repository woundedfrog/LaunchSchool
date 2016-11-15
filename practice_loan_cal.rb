

def prompt(message)
  puts "=> #{message}"
end

loop do
  prompt "Welcome! This is the Mortgage Calculator"
  prompt "Please enter the loan amount"
  
  amount = ''
  loop do
    amount = gets.chomp
    if amount.empty? || amount.to_f < 0
      prompt "Please enter a positive amount."
    else
      break
    end
  end
  
  prompt "Please enter the anual interest rate(APR)"
  prompt "(Example: 1 for 1%, 3 for 3%, etc.)"
  
  interest_rate = ''
  loop do
    interest_rate = gets.chomp
    if interest_rate.empty? || interest_rate.to_f < 0
      prompt "Please enter a positive number"
    else
      break
    end
  end
  
  prompt "Please enter the desired loan duration (years)."
  
  years = ''
  loop do
    years = gets.chomp
    if years.empty? || years.to_i < 0
      prompt "Error: Please enter a valid number!"
    else
      break
    end
  end
  
  anual_interest_rate = interest_rate.to_f / 100
  monthly_interest_rate = anual_interest_rate / 12
  months = years.to_i * 12
  
  monthly_payment = amount.to_f *
                    (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**-months.to_i))

  totals = years.to_i * 12 * monthly_payment
  
  prompt "Your monthly payment is: $#{format('%02.2f', monthly_payment)}"
  prompt "Your total payment after #{years} years is: #{totals.round(1)}"
  prompt "Another calculation? ('y' for yes - 'n' for no)"
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the Mortgage Calculator!")
