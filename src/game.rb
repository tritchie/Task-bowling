require 'rubygems'
require 'sinatra'
require 'haml'
require 'cucumber-sinatra'

get '/' do
  puts "Hello World!"
  haml :scorecard
end

