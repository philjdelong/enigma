require'./lib/test_helper'

class Enigma

  def random_key
    rand.to_s[2..6]
  end

  def current_date
    day = Date.today.day.to_s.rjust(2, "0")
    month = Date.today.month.to_s.rjust(2, "0")
    year = Date.today.year.to_s.slice(2,3)
    day+month+year
  end

  def encrypt(text, key = random_key, date = current_date)
    encryptor = Encryptor.new(text, key, date)
    {
      :encryption => encryptor.encryption(text),
      :key => key,
      :date => date
    }
  end

  def decrypt(text, key = random_key, date = current_date)
    encryptor = Decryptor.new(text, key, date)
    {
      :decryption => encryptor.decryption(text),
      :key => key,
      :date => date
    }
  end
end
