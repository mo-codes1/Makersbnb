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

  get '/booked' do
    erb(:booked)
  end

  post '/spaces' do
    p "This is the params #{params}"
    p "This is the params[:space_name] #{params[:space_name]}"
    Space.create(name: params[:space_name]) # might need to update this
    redirect '/spaces'
  end


  run! if app_file == $0
end