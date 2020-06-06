require 'byebug'
module Encryption
  module_function

  def split_keys(key)
    arr = []
    for i in 0..(key.length-2) do
      arr << key.slice(i,2).to_i
    end
    arr
  end

  def create_offset(date)
   ((date.to_i ** 2).to_s[-4..-1]).split("").map(&:to_i)

  end

  def final_shift(key, offset)
    key.map.with_index { |v,i| v + offset[i] }
  end

  def encrypt(message,final_shift)
    character_set = ("a".."z").to_a << " "
    split_message = message.split("")
    i = 0
    split_message.map do |character|
  #binding.pry
      shift = final_shift[i]
      index = character_set.find_index(character)
      new_index = index + shift
      new_character = character_set[new_index]
      i == final_shift.length ? 0 : i
      new_character
    end.join
  end

  def encrypt_alt(message,final_shift)
    split_message = message.split("")
    offset_array = split_message.map.with_index do |char, index|
      byebug
      f_index = (index % 4) + 1
      new_index = final_shift[f_index - 1]
      char_index = character_set.find_index(char)
      new_char_index = char_index + new_index
      character_set[new_char_index]
    end
    hash = Hash[split_message.zip(offset_array)]
  end

end
