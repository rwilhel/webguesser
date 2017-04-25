require 'sinatra'
require 'sinatra/reloader'

number = rand(0..101)
get '/' do
  erb :index, :locals => {:number => number}
end
