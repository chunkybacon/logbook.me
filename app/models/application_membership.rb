class ApplicationMembership < ActiveRecord::Base
  # Associations
  belongs_to :application
  belongs_to :user
end
