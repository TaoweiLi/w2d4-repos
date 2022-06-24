# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
  (num_1..num_1 * num_2).each do |i|
    if i % num_1 == 0 && i % num_2 == 0
      return i
    end
  end
end

# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
  hash = {}

  (0...(str.length - 1)).each do |i|
    current_char = str[i]
    next_char = str[i + 1]
    combined_char = current_char + next_char
    if hash.key?(combined_char)
      hash[combined_char] += 1
    else
      hash[combined_char] = 1
    end
  end

  most = nil
  most_char = nil
  hash.each do |k, v|
    if most == nil || v > most
      most = v
      most_char = k
    end
  end

  return most_char
end

class Hash
  # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
  def inverse
    new_hash = {}

    self.each do |k, v|
      new_hash[v] = k
    end

    return new_hash
  end
end

class Array
  # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
  def pair_sum_count(num)
    counter = 0

    (0...self.length).each do |i|
      ((i + 1)...self.length).each do |j|
        ele1 = self[i]
        ele2 = self[j]
        if ele1 + ele2 == num
          counter += 1
        end
      end
    end

    return counter
  end

  # Write a method, Array#bubble_sort, that takes in an optional proc argument.
  # When given a proc, the method should sort the array according to the proc.
  # When no proc is given, the method should sort the array in increasing order.
  #
  # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
  # two parameters, which represents the two elements in the array being compared.
  # If the block returns 1, it means that the second element passed to the block
  # should go before the first (i.e. switch the elements). If the block returns -1,
  # it means the first element passed to the block should go before the second
  # (i.e. do not switch them). If the block returns 0 it implies that
  # it does not matter which element goes first (i.e. do nothing).
  #
  # This should remind you of the spaceship operator! Convenient :)

  def bubble_sort(&prc)
    prc ||= Proc.new { |a, b| a <=> b }

    (0...self.length).reverse_each do |i|
      is_swap = false
      (0...i).each do |j|
        if prc.call(self[j], self[j + 1]) == 1
          self[j], self[j + 1] = self[j + 1], self[j]
          is_swap = true
        end
      end

      if !is_swap
        break
      end
    end

    return self
  end
end

