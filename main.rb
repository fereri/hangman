p File.exist?("lib/10000-words.txt")

words = File.open("lib/10000-words.txt")

word = File.readlines(words).sample.chomp

p word