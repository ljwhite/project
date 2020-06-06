require '../lib/encryption.rb'

class Enigma
include Encryption

  def encrypt(message, key, date)
    splitted_keys = Encryption.split_keys(key)
    offset = Encryption.create_offset(date)
    final_shift = Encryption.final_shift(splitted_keys, offset)
  end

end
