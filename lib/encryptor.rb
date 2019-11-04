require 'date'
require './lib/message'
require './lib/key'
require './lib/offset'
require './lib/message'

class Encryptor
  attr_reader :message, :key, :offsets, :date

  def initialize(message, key, date = Time.now)
    @message = message
    @key = Key.new(key)
    @offset = Offset.new(date)
    @char_list = ("a".."z").to_a << " "
  end

  def total_shift
    new_hash = {
      :a => @key.key_shifts[:a] + @offset.offset_shifts[:a],
      :b => @key.key_shifts[:b] + @offset.offset_shifts[:b],
      :c => @key.key_shifts[:c] + @offset.offset_shifts[:c],
      :d => @key.key_shifts[:d] + @offset.offset_shifts[:d]
    }
  end

  def encrypt(message = self.message, key = self.key, date = self.date)
    encrypted = {
      :encryption => @message.encryption(message),
      :key => key,
      :date => date
    }
  end

  def message_encription(message)
    ## stuck
  end

  def let_to_num(message)
    split_letters_downcase(message).map do |down_letter|
      if letter_key.keys.include?(down_letter)
        down_letter
        ## stuck
      end
    end
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
      if letter != ' '
        new_hash[letter] = sum + 1
        sum = sum + 1
      end
    end
    new_hash
  end
end
