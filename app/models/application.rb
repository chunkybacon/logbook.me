class Application < ActiveRecord::Base
  # Associations
  belongs_to :user

  # Attributes
  attr_accessible :name

  # Hooks
  before_create :generate_api_key

  # Validations
  validates_presence_of :name


  private

  def generate_api_key
    self.api_key = UUIDTools::UUID.random_create.to_s
  end

end
