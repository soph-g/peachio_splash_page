require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

class Lead

  include DataMapper::Resource

  property :id, Serial
  property :email, String, unique: true, format: :email_address

end


DataMapper.setup(:default, "postgres://localhost/peachio_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
