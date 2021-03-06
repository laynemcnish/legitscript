# Software Archeology

## Original Method
```
def function(a)
  a.inject({}){ |a,b| a[b] = a[b].to_i + 1; a}.\
  reject{ |a,b| b == 1 }.keys
end
```
## Explanation

Assuming that this function takes an array as the parameter “a”, the method takes the values of the given array and injects them into a hash with the keys (a) being the original array values and the values (b) being how many times the original array value was duplicated throughout the array.  

The next line removes all keys and values that only appeared in the original array once and returned just the keys that were left.

To give an example, if you provided the method with an array of [1,2,2,3,4,5,6,6,6,7], the final result would be [2, 6].

## Solution

To improve the given function, I broke it down into a few steps:

* I first wrote tests to test the original function and then the new method I would write.
* Next, I rewrote the function into a more explicit method
* Finally, I split my new method into two methods so that each would only be responsible for one thing.  The first method counts the duplicates and the second method returns the duplicated values.
* Throughout my refactoring, I ran my tests and consulted the results to make sure that with every change I made, I still have functioning methods.

## New Methods

```
  def count_duplicates(input_array)
    items_count = Hash.new(0)
    input_array.each do |item|
      items_count[item] += 1
    end
    items_count
  end

  def return_duplicated_values(input_array)
    duplicated_values =[]
    duplicate_count = count_duplicates(input_array)

    duplicate_count.each do |key, value|
      if value > 1
        duplicated_values.push(key)
      end
    end
    duplicated_values
  end
```  