#Exploring Procs, Lambdas, and Blocks: Returning
#
#For this exercise, we'll be learning and practicing our knowledge of returning from lambdas, procs, and implicit blocks. Run each group of code below: For your answer to this exercise, write down your observations for each group of code. After writing out those observations, write one final analysis that explains the differences between procs, blocks, and lambdas.

# Group 1
#def check_return_with_proc
#  my_proc = proc { return }
#  my_proc.call
#  puts "This will never output to screen."
#end
#
#check_return_with_proc

  #Observations:
  #1)If we return from within a Proc, and that Proc is defined within a method. Then, we will immediately exit that method(we return from the method). 

## Group 2
#my_proc = proc { return }
#
#def check_return_with_proc_2(my_proc)
#  my_proc.call
#end
#
#check_return_with_proc_2(my_proc)
  #Observations:
  #1) If we return from within a Proc and that Proc is defined outside of a method. Then, an error will be thrown when we call that Proc. This occurs because program execution jumps to where the Proc was defined when we call that Proc. We cannot return from the top level of the program.
  
## Group 3
#def check_return_with_lambda
#  my_lambda = lambda { return }
#  my_lambda.call
#  puts "This will be output to screen."
#end
#
#  
#check_return_with_lambda
#observations:
#1) If we return from within a Lambda, and that Lambda is defined within a method, then program execution jumps to where the Lambda code is defined. After that, code execution then proceeds to the next line of the method after the #call to that lambda.


## Group 4
my_lambda = lambda { return }
def check_return_with_lambda(my_lambda)
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda(my_lambda)
#observations:
#1) If we return from within a Lambda and that Lambda is defined outside a method, then program execution continues to the next line after the call to that Lambda. This is the same effect as the code in group 3.

# Group 5
#def block_method_3
#  yield
#end
#
#block_method_3 { return }

#Observations:
#If we return from an implicit block that is yielded to a method, then an error will be thrown. The reason for this error is the same as the one mentioned for group 2. We are trying to return from some code in our program that isn't in a method.


#EXTRA: 
#Using return to exit from an implicit block or an externally defined proc throws an error. When a block is defined within a method, return will exit the method. Return inside a lambda exits the lambda but allows the method to continue, regardless of where the lambda is defined.

#Comparison
#
#Procs and implicit blocks sometimes have the same behavior when we return from them. If a Proc is defined outside a method, and we return from it, then we'll get an error. The same thing occurs if we try to return from an implicit block, where the block itself isn't defined in a method. An error is thrown if we try to return from it.
#
#If we try to return from within a Proc that is defined within a method, then we immediately exit the method.
#
#If we try to return from a Lambda, the same outcome occurs, regardless of whether the Lambda is defined outside a method or inside of it. Eventually, program execution will proceed to the next line after the #call to that lambda.


outside2 = proc { inside = proc { return 'Returns this!' }; inside.call ; return 'Returns that!'}

 def my_method2(outside2)
   puts 2
   puts outside2.call
   rescue LocalJumpError
     puts 'Returns nothing...'
 end
my_method2(outside2)
  
  #1) a Return inside of a nested PROC(2nd level) will return raise a LOcalJumpError. The procs are defined inside of the main, and not in a method, so the return call is invalid.
  
  
  def my_method4(outside4)
   puts 4
   puts outside4.call
   rescue LocalJumpError
     puts 'Returns nothing...'
 end

 outside4 = lambda { inside = proc { return 'Returns this!' }; inside.call; return 'Returns that!' }

   my_method4(outside4)
   
   #Calling return inside a Proc, nested in a Lambda will return out of the lambda, back to the original calling location.
   #Procs returns completely out of the calling location. Since it's nested, it returns out of the Lambda and in this case "RETURN THIS" is passed(returned) to the puts method.
   
   
    outside3 = proc { inside = lambda { return 'Returns this!' }; inside.call; return 'Returns that!' }

 def my_method3(outside3)
   puts 3
   puts outside3.call
   rescue LocalJumpError
     puts 'Returns nothing...'
 end
   
   my_method3(outside3)
   
   #Calling a lambda inside of the proc returns a LocalJumpError because inside of the lambda, it returns and continues to execute teh next line in the proc. The proc returns, but is defined outside of the method(in in main) and thus is an invalid jump.