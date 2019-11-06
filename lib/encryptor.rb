require './lib/test_helper'

class Encryptor

  def initialize(message, key, date)
    @message = message
    @shifter = Shifter.new(key, date)
    @char_list = ("a".."z").to_a << " "
  end

  def split_letters_downcase(message)
    encryption = message.split('')
    encryption.map do |letter|
      letter.downcase
    end
  end

  def letter_keys
    sum = 0
    new_hash = {}
    @char_list.map do |letter|
      new_hash[letter] = sum + 1
      sum = sum + 1
    end
  new_hash
  end

  def message_to_num(message)
    split_letters_downcase(message).map do |letter|
      if @char_list.include?(letter) == false
        letter
      elsif letter == (' ')
        letter = 27
      else
        letter.ord - 96
      end
    end
  end

  def shift_message(message)
    rotator = @shifter.total_shift.values
    message_to_num(message).map do |value|
      if value.class == Integer
        value = (value + rotator.first)
        rotator = rotator.rotate
      end
      value
    end
  end

  def encryption(message)
    shift_message(message).map do |value|
      if value %27 == 0
        value = (' ')
      elsif value.class == Integer
        value = (value %27) + 96
      else
        value = value
      end.chr
    end.join
  end
end
