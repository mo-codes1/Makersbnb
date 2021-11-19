require 'sinatra/base'
require 'sinatra/reloader'
require './lib/space'
require './lib/owner'

class BnB < Sinatra::Base
  enable :sessions unless test?
    set :session_secret, "secret"
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


  post '/spaces' do
    p "This is the params #{params}"
    p "This is the params[:space_name] #{params[:space_name]}"
    Space.create(name: params[:space_name], owner_name: params[:owner_name]) # might need to update this
    redirect '/spaces'
  end

  post '/book_space' do
    Space.book(name: params[:space_name])
    session[:booked_space] = params[:space_name]
    redirect '/booked'
  end

  get '/booked' do
    @booked_space = session[:booked_space]
    erb(:booked)
  end

  get '/add_space' do
    erb(:list_a_space)
  end

  post '/add_space' do
    redirect '/spaces'
  end


  run! if app_file == $0
end