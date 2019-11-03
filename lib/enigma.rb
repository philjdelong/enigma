require'./lib/encryptor'
require'./lib/decryptor'

class Enigma
  attr_reader :char_list

  def initialize
    @char_list = ("a".."z").to_a << " "
    @encryptor = Encryptor.new(message, key, date)
    @decryptor = Decryptor.new(cyphertext, key, date)
  end

  def encrypt(message, key, date)
    @encryptor.encrypt(message, key, date)
  end

  def decrypt(cyphertext, key, date)
    @decryptor.decrypt(cyphertext, key, date)
  end
end
