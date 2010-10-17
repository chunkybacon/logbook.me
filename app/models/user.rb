class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable,
  :lockable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  # Associations
  has_many :applications, :dependent => :destroy

  # Hack hack
  def display_name
    name.blank? ? email : name
  end
  
end
