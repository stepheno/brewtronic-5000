class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :name,  :password_confirmation, :remember_me
  # attr_accessible :title, :body
  validate :name, :presence => true
  validate :email, :presence => true, :uniqueness => true
  
  self.per_page = 10
end
