class Lead

  include DataMapper::Resource

  property :id, Serial
  property :email, String, unique: true, required: true, format: :email_address


end
