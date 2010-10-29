class InviteFactory
  attr_accessor :app, :invite
  delegate :errors, :to => :invite

  def initialize(app, params)
    self.app, self.invite = app, Invite.new(params)
  end

  def save
    if invite.user.nil?
      invite.application = app
      invite.save
    elsif !app.users.include?(invite.user)
      app.users << invite.user
    end
  end
end
