class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation

  has_secure_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :comments
  has_many :stories

  def to_s
    name
  end
end
