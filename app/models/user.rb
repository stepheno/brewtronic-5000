class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :name, :password_confirmation, :remember_me
  # User preferences
  attr_accessible :mass_units, :volume_units, :length_units, :temp_units, :time_zone
  
  # Associatons
  has_many :users
  # attr_accessible :title, :body
  validate :name, :presence => true
  validate :email, :presence => true, :uniqueness => true
  validate :mass_units, :presence => true
  validate :volume_units, :presence => true
  validate :length_units, :presence => true
  validate :time_zone, :presence => true
  
  self.per_page = 10
end
