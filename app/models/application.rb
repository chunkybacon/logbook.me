class Application < ActiveRecord::Base
  # Associations
  has_many :application_memberships
  has_many :users, :through => :application_memberships
  has_one  :owner, :through => :application_memberships, :conditions => { :owner => true }
  has_many :entries
  has_many :invites

  # Attributes
  attr_accessible :name, :time_zone

  # Hooks
  before_create :generate_api_key

  # Validations
  validates_presence_of :name, :time_zone

  # Instance Methods

  def to_s; name; end

  private

    def generate_api_key
      self.api_key = UUIDTools::UUID.random_create.to_s
    end
end
