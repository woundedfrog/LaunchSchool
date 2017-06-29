#Ben asked Alyssa to code review the following code:

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end
#Alyssa glanced over the code quickly and said - "It looks fine, except that you forgot to put the @ before balance when you refer to the balance instance variable in the body of the positive_balance? method."
#
#"Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an @!"
#
#Who is right, Ben or Alyssa, and why?

#Answer:

#Ben in correct, he isn't missing a "@" before the balance variable.
#The class above has a getter method - i.e. "atte_reader". This allows Ben to reference the balance instance method without needing to prefix the "@".

#Though he could have referenced the balance menthod like so "@balance", it's not necessary. 
#If the class did not have a getter method, then Alyssa definitely would have been correct and Ben would have needed the "@"