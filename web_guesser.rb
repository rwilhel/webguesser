require 'sinatra'
require 'sinatra/reloader'
require 'pry'

NUMBER = rand(100)
guess = nil
message = "Guess a secret number between 0 and 100!"
color = "teal"

get '/' do
  if params["guess"] != nil
    guess = params["guess"].to_i
    message = check_guess(guess)
    color = color_change(message)
  end
  erb :index, :locals => {:number => NUMBER, :message => message, :color => color}
end

def check_guess(guess)
  if guess > NUMBER + 5
    "Way too high!"
  elsif guess > NUMBER
    "Too high!"
  elsif guess < NUMBER - 5
    "Way too low!"
  elsif guess < NUMBER
    "Too low!"
  else guess = NUMBER
    "You got it right!\n The SECRET number is #{NUMBER}."
  end
end

def color_change(message)
  case message
  when "You got it right!\n The SECRET number is #{NUMBER}." then "green"
  when "Too low!" then "pink"
  when "Way too low!" then "red"
  when "Too high!" then "pink"
  when "Way too high!" then "red"
  else "teal"
  end
end
