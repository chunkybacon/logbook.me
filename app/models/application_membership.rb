class ApplicationMembership < ActiveRecord::Base
  # Associations
  belongs_to :application
  belongs_to :user

  # Hooks
  before_create :mark_first_user_as_owner

  private

    def mark_first_user_as_owner
      self.owner = true if application.users.empty?
    end
end
