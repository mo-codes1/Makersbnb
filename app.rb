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
    Space.create(params[:space])
    redirect '/spaces'
  end

  get '/add_space' do
    erb(:list_a_space)
  end

  post '/add_space' do
    redirect '/spaces'
  end


  run! if app_file == $0
end