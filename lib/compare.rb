class Compare 
  
  def self.compare(word)
    split = word.split("")
    length = word.length()
    correct_word = Array.new(length, "_")
    
    until correct_word.include?("_") == false do
      input = gets.chomp

      split.each_with_index do |char, index|
        if char == input
          correct_word[index] = char
        else
          next
        end
      end

      joined = correct_word.join("")
      p joined

    end

  end

end