require'./lib/encryptor'

class Enigma

  def initialize(message, keys, date)
    @encryptor = Encryptor.new(message, keys, date)
    # @decryptor = Decryptor.new(cyphertext, keys, date)
  end

  def encrypt(message, keys, date)
    @encryptor.encrypt(message, keys, date)
  end

  def decrypt(cyphertext, keys, date)
    @decryptor.decrypt(cyphertext, keys, date)
  end
end
