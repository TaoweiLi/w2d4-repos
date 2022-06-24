# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array.
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]

#gp:
#--nested loop --get distinct pair arr,
#--join the arr to string
#--loop the vowels
#--check if all the vowels included in the string

def include_all_vowels?(string)
  vowels = "aeiou"

  vowels.each_char do |char|
    if !string.include?(char.downcase)
      return false
    end
  end

  return true
end

def all_vowel_pairs(words)
  vowels = "aeiou"
  pairs = []

  (0...words.length).each do |i|
    ((i + 1)...words.length).each do |j|
      ele1 = words[i]
      ele2 = words[j]
      pair = ele1 + " " + ele2
      if include_all_vowels?(pair)
        pairs << pair
      end
    end
  end

  return pairs
end

# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false

def composite?(num)
  (2...num).each do |i|
    if num % i == 0
      return true
    end
  end

  return false
end

p composite?(9)     # => true
p composite?(13)    # => false

# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]

# gp:
#--takes in a str and an arr
#--return a new arr--var
#--loop the given bigrams
#--check if the ele included in the string
# --if treu add to new arr

def find_bigrams(str, bigrams)
  new_arr = []

  bigrams.each do |ele|
    if str.include?(ele)
      new_arr << ele
    end
  end

  return new_arr
end

class Hash
  # Write a method, Hash#my_select, that takes in an optional proc argument
  # The method should return a new hash containing the key-value pairs that return
  # true when passed into the proc.
  # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
  #
  # Examples:
  #
  # hash_1 = {x: 7, y: 1, z: 8}
  # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
  #
  # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
  # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
  # hash_2.my_select                            # => {4=>4}

  def my_select(&prc)
    prc ||= Proc.new { |k, v| k == v }
    new_hash = {}

    self.each do |k, v|
      if prc.call(k, v)
        new_hash[k] = v
      end
    end

    return new_hash
  end
end

class String
  # Write a method, String#substrings, that takes in a optional length argument
  # The method should return an array of the substrings that have the given length.
  # If no length is given, return all substrings.
  #
  # Examples:
  #
  # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
  # "cats".substrings(2)  # => ["ca", "at", "ts"]

  def substrings(length = nil)
    arr = []

    (0...self.length).each do |i|
      (i...self.length).each do |j|
        sub_string = self[i..j]
        if length == nil || self[i..j].length == length
          arr << sub_string
        end
      end
    end

    return arr
  end

  # Write a method, String#caesar_cipher, that takes in an a number.
  # The method should return a new string where each char of the original string is shifted
  # the given number of times in the alphabet.
  #
  # Examples:
  #
  # "apple".caesar_cipher(1)    #=> "bqqmf"
  # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
  # "zebra".caesar_cipher(4)    #=> "difve"
  def caesar_cipher(num)
    alphabet = ("a".."z").to_a
    new_str = ""

    self.each_char do |ele|
      index = alphabet.index(ele)
      shifted_index = (index + num) % alphabet.length
      shifted_char = alphabet[shifted_index]
      new_str += shifted_char
    end

    return new_str
  end
end
