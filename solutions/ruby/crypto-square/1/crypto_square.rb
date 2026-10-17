=begin
Write your code for the 'Crypto Square' exercise in this file. Make the tests in
`crypto_square_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/crypto-square` directory.

 r * c >= length of message,
and c >= r,
and c - r <= 1
=end

debug "Hello we have a problem"

class Crypto
  def initialize(plaintext)
    @plaintext = plaintext
  end

  def cleartext()
    @plaintext.gsub(/[^a-zA-Z0-9]/, "").downcase
  end
  def nb_columns()
    #debug "found #{Math.sqrt(size).ceil} as nb_colums"
    Math.sqrt(size).ceil
  end
  def nb_rows()
    if size > nb_columns * (nb_columns - 1)
      nb_columns
    else
      nb_columns - 1
    end
  end
  def size()
    # debug "found #{cleartext.length} as length of cleartext"
    cleartext.length
  end

  def ciphertext()
    result = Array.new(nb_columns) { Array.new(nb_rows, " ") }
    (0...cleartext.length).each do |pos|
      col_index = pos % nb_columns
      row_index = pos / nb_columns
        result[col_index][row_index] = cleartext[pos] 
    end
    final_result = result.map(&:join).join(" ")
    final_result
  end
end
