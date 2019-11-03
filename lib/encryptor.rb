require 'date'
require './lib/key'
require './lib/offsets'

class Encryptor
  attr_reader :message, :key, :offsets, :date

  def initialize(message, key, date = Time.now)
    @message = message
    @key = Key.new(key)
    @offsets = Offsets.new(date)
    @char_list = ("a".."z").to_a << " "
  end

  def total_shift
    new_hash = {
      :a => @key.key_shifts[:a] + @offsets.offsets_shifts[:a],
      :b => @key.key_shifts[:b] + @offsets.offsets_shifts[:b],
      :c => @key.key_shifts[:c] + @offsets.offsets_shifts[:c],
      :d => @key.key_shifts[:d] + @offsets.offsets_shifts[:d]
    }
  end

  def encrypt(message = self.message, key = self.key, date = self.date)
    encrypted = {
        :encryption => message_encription(message),
        :key => key,
        :date => date
      }
  end

  def message_encription(message)
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
