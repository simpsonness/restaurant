class User < ActiveRecord::Base
  has_many :comments
  has_many :tables, :through => :comments 
  has_many :reservations

  authenticates_with_sorcery!

 
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
end
