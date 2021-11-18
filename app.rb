require 'sinatra/base'
require 'sinatra/reloader'
require './lib/space'
require './lib/owner'

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

  get '/booked' do
    erb(:booked)
  end

  post '/spaces' do
    p "This is the params #{params}"
    p "This is the params[:space_name] #{params[:space_name]}"
    Space.create(name: params[:space_name]) # might need to update this
    redirect '/spaces'
  end

  post '/book_space' do
    p "This is the params[:space_name] #{params[:space_name]}" # this works. returns the space name 
    # here call the update Spaces method and pass in the returned space name e.g. Windsor Castle
    redirect '/booked'
  end

  get '/add_space' do
    erb(:list_a_space)
  end

  post '/add_space' do
    redirect '/spaces'
  end


  run! if app_file == $0
end