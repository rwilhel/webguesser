require 'sinatra'
require 'sinatra/reloader'
require 'pry'

NUMBER = rand(100)
guess = nil
message = "Guess a secret number between 0 and 100!"

get '/' do
  if params["guess"] != nil
    guess = params["guess"].to_i
    message = check_guess(guess)
  end
  erb :index, :locals => {:number => NUMBER, :message => message}
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
