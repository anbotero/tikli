require 'mongoid'

Mongoid.load!('config/mongoid.yml')

class Cackler
#  include Mongo
  attr_accessor :role

  def self.has_roles(*names)
    names.each do |name|
      define_method("is_#{name}?") do
        self.role == "#{name}"
      end
    end
  end

  def authenticate
    
  end

  has_roles :admin, :moderator, :guest
end