require 'http'

user_input = nil

until user_input == "q"

  p "Please enter a word you would like the definition, top example, and pronunciation of. You can keep entering words after your first word. Type q to quit"
  user_input = gets.chomp 

  break if user_input == "q"

  dictionary = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_input}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

  top_example = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_input}/topExample?useCanonical=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

  pronunciation = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_input}/pronunciations?useCanonical=false&limit=50&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

  audio = HTTP.get("https://api.wordnik.com/v4/word.json/#{user_input}/audio?useCanonical=false&limit=50&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

  p "The defintion of #{user_input} is #{dictionary.parse[1]["text"]}"
  p "The top example of #{user_input} is #{top_example.parse["text"]}"
  p "The pronunciation of #{user_input} is #{pronunciation.parse[0]["raw"]}"
  p audio.parse

end
