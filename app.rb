require 'sinatra/base'
require 'sinatra/reloader'
require './lib/spaces'

class BnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb (:index)
  end

  get '/spaces' do
    @rooms = Spaces.all
    erb(:spaces)
  end


  run! if app_file == $0
end