class Invite < ActiveRecord::Base
  # Associations
  belongs_to :application
  belongs_to :user, :foreign_key => 'email', :primary_key => 'email'

  # Validations
  validates_presence_of :email
  validates_format_of :email, :with => Devise.email_regexp
  validates_uniqueness_of :email, :scope => :application_id, :case_sensitive => false
end
