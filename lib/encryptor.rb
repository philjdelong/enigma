require 'date'
require './lib/key'
require './lib/offset'

class Encryptor
  attr_reader :message, :key, :offset, :date

  def initialize(message, key = Key.new, date = Time.now)
    @message = message
    @key = Key.new(key)
    @offset = Offset.new(date)
    @char_list = ("a".."z").to_a << " "
  end

  def encrypt(message = self.message, key = self.key, date = self.date)
    encrypted = {
      :encryption => encryption(message),
      :key => key,
      :date => date
    }
  end

  def total_shift
    new_hash = {
      :a => @key.key_shifts[:a] + @offset.offset_shifts[:a],
      :b => @key.key_shifts[:b] + @offset.offset_shifts[:b],
      :c => @key.key_shifts[:c] + @offset.offset_shifts[:c],
      :d => @key.key_shifts[:d] + @offset.offset_shifts[:d]
    }
  end

  def split_letters_downcase(message)
    encryption = message.split('')
    encryption.map do |letter|
      letter.downcase
    end
  end

  def letter_key
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
    rotator = total_shift.values
    message_to_num(message).map do |value|
      if value.class == Integer
        value = (value + rotator.first)
        rotator = rotator.rotate
      end
      value
    end
  end

  def encryption(message)
    
  end
end
