require "json"

class Word

  attr_accessor :true_word
  @@got_word = false

#saving game portion.

  def self.save
    word_hash = {"true_word" => @true_word}
    
    File.open("word_save.json", "w") do |file|
      file.write(JSON.pretty_generate(word_hash))
    end
  end

  def self.load
    @@got_word = true
    word_read = File.read("word_save.json")
    word_data = JSON.parse(word_read)

    @true_word = word_data["true_word"]
  end

  def self.get_word
    words = File.open("lib/10000-words.txt")
    @true_word = ""
    word_length = false

    # get word between 5 and 12 characters long
    if @@got_word == false
      until word_length == true do
        word = File.readlines(words).sample.chomp

        if word.length >= 5 and word.length <= 12
          @true_word = word
          word_length = true
        else
          next
        end
      end
    end

    p @true_word
    return @true_word
  end
  
end