def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do
  prompt("Welcome to the Mortgage Calculator!")

  prompt("Please enter the loan amount?")

  amount = ''
  loop do
    amount = Kernel.gets().chomp()

    if amount.empty?() || amount.to_f() < 0
      prompt("Please enter a positive number.")
    else
      break
    end
  end

  prompt("Please enter anual interest rate(APR).")
  prompt("(Example: 7 for 7% or 5.5 for 5.5%)")

  int_rate = ''
  loop do
    int_rate = Kernel.gets().chomp()

    if int_rate.empty?() || int_rate.to_f() < 0
      prompt("Please enter a positive number.")
    else
      break
    end
  end

  prompt("Please enter a loan duration(years)")

  years = ''
  loop do
    years = Kernel.gets().chomp()

    if years.empty?() || years.to_i() < 0
      prompt("Enter a valid number")
    else
      break
    end
  end

  annual_int_rate = int_rate.to_f() / 100
  monthly_int_rate = annual_int_rate / 12
  months = years.to_i() * 12

  monthly_payment = amount.to_f() *
                    (monthly_int_rate /
                    (1 - (1 + monthly_int_rate)**-months.to_i()))
  total = years.to_i() * 12 * monthly_payment

  prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")
  prompt("Your total payment after #{years} years is: #{total.round(1)}")
  prompt("Another calculation?")
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the Mortgage Calculator!")
