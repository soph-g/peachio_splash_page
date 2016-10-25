ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'datamapper_setup'

class Peachio < Sinatra::Base

  register Sinatra::Flash

  get '/' do
    erb :'leads/new'
  end

  post '/leads' do
    lead = Lead.new(email: params[:email])
    if lead.save
      erb :'leads/index'
    else
      flash.now[:errors] = "There was a problem with registering your email, please try again"
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
