class Word
  
  def self.get_word

    p Dir.pwd
    p File.exist?("./10000words.txt")
    words = File.open("10000-words.txt")

    @word = File.readlines(words).sample

    return p @word


  end

end