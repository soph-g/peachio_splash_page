require 'data_mapper'
require 'dm-postgres-adapter'

class Lead

  include DataMapper::Resource

  property :id, Serial
  property :email, String

end


DataMapper.setup(:default, "postgres://localhost/peachio_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
