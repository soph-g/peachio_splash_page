ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/lead'

class Peachio < Sinatra::Base

  register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/' do
    @lead = Lead.new(email: params[:email])
    if @lead.save
      erb :thanks
    else
      flash.now[:errors] = "There was a problem with registering your email, please try again"
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
