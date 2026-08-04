require "msgpack"

class Compare

  attr_accessor :correct_word, :incorrect_letters
  
  def self.compare(word)
    split = word.split("")
    length = word.length()
    @correct_word = Array.new(length, "_")
    @incorrect_letters = []

    #load or save game
    puts "Do you want to load or save a game(y/n)?"
    option = gets.chomp
    if option == "y"
      Compare.load
      Word.load
    elsif option == "n"
      puts "Entering a new game"
    end
    
    
    until @correct_word.include?("_") == false do
      input = gets.chomp

      if input == "quit"
        puts "Quiting game"
        Word.save
        Compare.save
        break
      end

      if split.include?(input) == false
        @incorrect_letters.push(input)
      end

      split.each_with_index do |char, index|
        if char == input
          @correct_word[index] = char
        else
          next
        end
      end

      joined = @correct_word.join("")
      p joined
      puts "The incorrect letters are: #{@incorrect_letters.join("")}."

    end

  end

  #saving the game portion of code.
  
  def self.save
    compare_hash = {"correct_word" => @correct_word, "incorrect_letters" => @incorrect_letters}

    File.open("compare_save.json", "w") do |file|
      file.write(JSON.pretty_generate(compare_hash))
    end
  end

  def self.load
    compare_read = File.read("compare_save.json")
    compare_data = JSON.parse(compare_read)

    @correct_word = compare_data["correct_word"]
    @incorrect_letters = compare_data["incorrect_letters"]
  end

end