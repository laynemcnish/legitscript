# Software Archeology

## Original Method

def function(a)
  a.inject({}){ |a,b| a[b] = a[b].to_i + 1; a}.\
  reject{ |a,b| b == 1 }.keys
end

## Explanation

Assuming that this function takes an array as the parameter “a”, the method takes the values of the given array and injects them into a hash with the keys (a) being the original array values and the values (b) being how many times the original array value was duplicated throughout the array.  The next line removes all keys and values that only appeared in the original array once and returned just the keys that were left.

To give an example, if you provided the method with an array of [1,2,2,3,4,5,6,6,6,7], the final result would be [2, 6].

## Solution