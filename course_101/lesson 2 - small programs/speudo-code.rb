while user wants to keep going
  - ask the user for a collection of numbers
    -iterate through the collection one by one
      -save the first value as the starting value.
      -for each iteration, compare the saved value with the current value.
      -if the saved value is greated, or it is the same
        -movie to the net value in the collection.
      -otherwise if the currect value is greater
        -reassign the saved value as the current value

    -after iterating through the collection, save the largest value into the list
    - ask the user if they want to input another collection

  return saved list of numbers

START
        
SET large_numbers = []
SET keep_going = true
        
While keep_going == true
  GET "enter a collection"
  SET collection
  SET large_numbers = SUBPROCESS "extract the largest one from that collection" push_numbers.push(large_number)
  GET "enter anothe collection?"
  IF "yes"
      keep_going = true
  ELSE
    keep_going = false
  IF keep_going == false
      exit the loop
        
  PRINT large_numbers

END
        
        
