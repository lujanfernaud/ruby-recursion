# Project: Merge sort in Ruby using recursion for The Odin Project
# Author: Luján Fernaud
#
# Instructions:
#
# Build a method #merge_sort that takes in an array and returns a sorted array,
# using a recursive merge sort methodology.

def merge_sort(array)
  return array if array.length == 1

  mid   = (array.length / 2).floor
  left  = array[0...mid]
  right = array[mid..-1]

  left  = merge_sort(left)
  right = merge_sort(right)

  merge(left, right)
end

def merge(left, right)
  result = []
  until left.length.zero? || right.length.zero?
    result << (left.first <= right.first ? left.shift : right.shift)
  end
  result + left + right
end

numbers_array = [2, 5, 8, 33, 55, 1, 12, 0, 8]
letters_array = %w[a d b z o d a y]

p merge_sort(numbers_array) # => [0, 1, 2, 5, 8, 8, 12, 33, 55]
p merge_sort(letters_array) # => ["a", "a", "b", "d", "d", "o", "y", "z"]
