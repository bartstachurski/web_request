# Build a terminal dictionary app
# Create a new ruby file called dictionary_app.rb
# The program should ask the user to enter a word, then use the wordnik API to show the word’s definition: https://developer.wordnik.com/docs#!/word/getDefinitions
# Once that works, have it also display the top example and pronunciation (browse through the documentation to the top example and pronunciation).
# Bonus: Write your program in a loop such that the user can keep entering new words without having to restart the program. Give them the option of entering q to quit.
# Bonus: Search for the audio section in the documentation. Use wordnik’s audio api to get the first fileUrl to open in the browser (you’ll need to google this!) and pronounce the name of the word.
# Wordnik.com
# Wordnik API Documentation
# The Wordnik API Docs

require 'http'

user_input = nil

until user_input == "q"

  p "Please enter a word you would like the definition, top example, and pronunciation of. You can keep entering words after your first word. Type q to quit"
  user_input = gets.chomp 

  break if user_input == "q"

  dictionary = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_input}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=")

  top_example = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_input}/topExample?useCanonical=false&api_key=")

  pronunciation = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_input}/pronunciations?useCanonical=false&limit=50&api_key=")

  audio = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_input}/audio?useCanonical=false&limit=50&api_key=")

  p "The defintion of #{user_input} is #{dictionary.parse[1]["text"]}"
  p "The top example of #{user_input} is #{top_example.parse["text"]}"
  p "The pronunciation of #{user_input} is #{pronunciation.parse[0]["raw"]}"
  p audio.parse
end

# For Bart - set the definition, pronunciation, etc. as individual variables (e.g. top_example)

# response = HTTP.get etc.

# pronunciation = response.parse[0]["key"]