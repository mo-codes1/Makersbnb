require 'sinatra/base'
require 'sinatra/reloader'
require './lib/space'

class BnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  get '/' do
    erb (:index)
  end

  get '/spaces' do
    @spaces = Space.all
    erb(:spaces)
  end
   
  # post route here to send param name of hotel 
  # to the database to change available status to false
  # redirect to '/booked'
  # space = Space.book(name: params[:name]) in app.rb ?

  get '/booked' do

    erb(:booked)
  end


  run! if app_file == $0
end