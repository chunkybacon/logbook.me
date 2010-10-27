class Invite < ActiveRecord::Base
  # Associations
  belongs_to :application
  belongs_to :user, :foreign_key => 'email', :primary_key => 'email'
end
