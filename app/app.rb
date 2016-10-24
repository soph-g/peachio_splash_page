ENV["RACK_ENV"] ||= "development"


require 'sinatra/base'
require_relative 'models/lead'

class Peachio < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    Lead.create(email: params[:email])
    erb :thanks
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
