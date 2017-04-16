# Project: Fibonacci in Ruby using recursion for The Odin Project
# Author: Luján Fernaud
#
# Instructions:
#
# 1. Write a method #fibs which takes a number and returns that many members
# of the fibonacci sequence. Use iteration for this solution.
#
# 2. Now write another method #fibs_rec which solves the same problem
# recursively. This can be done in just 3 lines (or 1 if you're crazy,
# but don't consider either of these lengths a requirement... just get it done).

require "benchmark"

def fibs(number)
  array = []
  (0..number).each do |n|
    array << (n < 2 ? n : array[n - 2] + array[n - 1])
  end
  array.last
end

def fibs_rec(number)
  number < 2 ? number : fibs_rec(number - 2) + fibs_rec(number - 1)
end

number = 9

# fibs(9) => 34
puts "\nfibs(#{number}) => #{fibs(number)}"

# fibs_rec(9) => 34
puts "fibs_rec(#{number}) => #{fibs_rec(number)}"

puts "\n----------"
puts "Benchmarks"
puts "----------\n\n"

Benchmark.bm do |benchmark|
  benchmark.report("fibs(33)    ") { fibs(33) }
  benchmark.report("fibs_rec(33)") { fibs_rec(33) }
end

puts "\n"
