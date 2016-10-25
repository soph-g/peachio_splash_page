class Lead

  include DataMapper::Resource

  property :id, Serial
  property :email, String, unique: true, format: :email_address

end
