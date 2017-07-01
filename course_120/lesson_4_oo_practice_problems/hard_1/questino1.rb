#Alyssa has been assigned a task of modifying a class that was initially created to keep track of secret information. The new requirement calls for adding logging, when clients of the class attempt to access the secret data. Here is the class in its current form:

#class SecretFile 
#  attr_reader :data
#
#  def initialize(secret_data)
#    @data = secret_data
#  end
#end
#She needs to modify it so that any access to data must result in a log entry being generated. That is, any call to the class which will result in data being returned must first call a logging class. The logging class has been supplied to Alyssa and looks like the following:

#class SecurityLogger
#  def create_log_entry
#    # ... implementation omitted ...
#  end
#end
#Hint: Assume that you can modify the initialize method in SecretFile to have an instance of SecurityLogger be passed in as an additional argument. It may be helpful to review the lecture on collaborator objects for this practice problem.

#Answer:

#Since we can pass in an instance of the SecurityLogger to the initialize method in SecretFile, we are able to assign it to an instance variable.
#It then becomes a collaborator object of the Secretfile class.
#We remove the attr method and replace it with a custom getter method, in which we are able to call the create_log_entry on the logger instance.
#Every time the data is called and retreived, the log is created.

class SecretFile 
  def initialize(secret_data, security_log)
    @data = secret_data
    @security_log = security_log
  end
  
  def data
    @security_log.create_log_entry
    @data
end

class SecurityLogger
  def create_log_entry
    # ... implementation omitted ...
  end
end
  
  