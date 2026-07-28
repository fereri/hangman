class Compare 
  
  def self.compare(word)
    split = word.split("")
    length = word.length()
    correct_word = Array.new(length, "_")
    incorrect_letters = []
    
    until correct_word.include?("_") == false do
      input = gets.chomp

      if split.include?(input) == false
        incorrect_letters.push(input)
      end

      split.each_with_index do |char, index|
        if char == input
          correct_word[index] = char
        else
          next
        end
      end

      joined = correct_word.join("")
      p joined
      puts "The incorrect letters are: #{incorrect_letters.join("")}."

    end

  end

end