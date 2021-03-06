# frozen_string_literal: true

# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
  ([num_1, num_2].max..(num_1 * num_2)).each do |i|
    return i if (i % num_1).zero? && (i % num_2).zero?
  end
end

# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
  bigrams = Hash.new(0)

  (0...str.length - 1).each do |i|
    bigrams[str[i..i + 1]] += 1
  end
  bigrams.max_by { |_k, v| v }[0]
end

class Hash
  # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
  def inverse
    # invert
    inversed = {}
    each do |k, v|
      inversed[v] = k
    end
    inversed
  end
end

class Array
  # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
  def pair_sum_count(num)
    sum_count = 0
    self[0..-2].each_with_index do |num1, i|
      self[i + 1..-1].each do |num2|
        sum_count += 1 if num1 + num2 == num
      end
    end
    sum_count
  end

  # Write a method, Array#bubble_sort, that takes in an optional proc argument.
  # When given a proc, the method should sort the array according to the proc.
  # When no proc is given, the method should sort the array in increasing order.
  def bubble_sort(&prc)
    prc ||= proc { |a, b| a <=> b }

    sorted = false
    until sorted
      sorted = true
      (0...length - 1).each do |i|
        if prc.call(self[i], self[i + 1]) == 1
          sorted = false
          self[i], self[i + 1] = self[i + 1], self[i]
        end
      end
    end

    self
  end
end
