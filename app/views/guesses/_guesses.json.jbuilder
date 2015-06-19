json.array! guesses do |guess|
  json.partial! 'guess', guess: guess
end