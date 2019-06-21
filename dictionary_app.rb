require 'http'

p "Please enter a word you would like the definition for:"
user_input = gets.chomp 

dictionary = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_input}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=")

p dictionary.parse[1]["text"]