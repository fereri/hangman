require_relative "lib/compare"

words = File.open("lib/10000-words.txt")
true_word = ""
word_length = false

# get word between 5 and 12 characters long
until word_length == true do
  word = File.readlines(words).sample.chomp

  if word.length >= 5 and word.length <= 12
    true_word = word
    word_length = true
  else
    next
  end
end

p true_word

Compare.compare(true_word)