require 'rubygems'
require 'sinatra'
require 'haml'
require 'cucumber-sinatra'

get '/' do
  haml :scorecard
end

