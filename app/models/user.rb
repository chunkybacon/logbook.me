class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :token_authenticatable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :lockable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :applications_attributes

  # Associations
  has_many :application_memberships
  has_many :applications, :through => :application_memberships
  accepts_nested_attributes_for :applications

  # Validations
  validates_length_of :name, :maximum => 64

  # Hack hack
  def display_name
    name.blank? ? email : name
  end
end
