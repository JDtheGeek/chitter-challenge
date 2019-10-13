require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/peeper/new' do
    username = params[:username]
    email = params[:email]
    password = params[:password]
    password_check = params[:password_check]
    "Welcome #{username}"
  end

  run! if app_file == $0

end