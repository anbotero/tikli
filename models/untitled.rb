#require 'mongo_mapper'

class User
  include MongoMapper::Document

  key :id,               Serial
  key :login,            String, :key => true, :length => (3..40), :required => true
  key :hashed_password,  String
  key :email,            String, :format => :email_address
  key :salt,             String
  key :created_at,       DateTime, :default => DateTime.now

  validates_presence_of :login, :email

  def password=(pass)
    @password = pass
    self.salt = Helpers::random_string(10) unless self.salt
    self.hashed_password = User.encrypt(@password, self.salt)
  end

  def self.encrypt(pass, salt)
    Digest::SHA1.hexdigest(pass + salt)
  end

  def self.authenticate(login, pass)
    u = User.first(:login => login)
    return nil if u.nil?
    return u if User.encrypt(pass, u.salt) == u.hashed_password
    nil
  end
end