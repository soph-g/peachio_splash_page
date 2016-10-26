ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'


class Peachio < Sinatra::Base

  register Sinatra::Flash

  require_relative 'datamapper_setup'
  require_relative 'server'
  require_relative 'controllers/leads'

  # start the server if ruby file executed directly
  run! if app_file == $0

end
