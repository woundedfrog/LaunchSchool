#In the last question Alyssa showed Alan this code which keeps track of items for a shopping cart application:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end
#Alan noticed that this will fail when update_quantity is called. Since quantity is an instance variable, it must be accessed with the @quantity notation when setting it. One way to fix this is to change attr_reader to attr_accessor and change quantity to self.quantity.
#
#Is there anything wrong with fixing it this way?
#

#ANSWER:

#There is nothing, perse. However, having a setter method allows us to modify that variable directly on the instance. e.g. "instance.quantity = <new_value>"
#This makes the it less secure and leaves room for potential problems later on.