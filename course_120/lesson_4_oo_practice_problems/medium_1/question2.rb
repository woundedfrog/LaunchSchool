#Alyssa created the following code to keep track of items for a shopping cart application she's writing:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end
#Alan looked at the code and spotted a mistake. "This will fail when update_quantity is called", he says.

#Can you spot the mistake and how to address it?

#ANSWER:
#The class above only has a getter method(attr_reader). 
#On line 13, Alyssa attempting to references the quantity variable through the attr_reader and reassign it a new value.
#attr_reader is a getter method, not a setter method(can change the values).
#a getter method allows us to retreive the value, not set it.

#To avoid this there are two options.
#1) Access the quantity variable on line 13 like so "@quantity"
#or
#2) change the 'attr_reader' method to 'attr_accessor' & change "quantity' to "self.quantity". This will give write and read access.