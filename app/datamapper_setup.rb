require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

require_relative 'models/lead'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/peachio_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
