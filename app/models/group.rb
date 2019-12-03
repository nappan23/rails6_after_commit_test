class Group < ApplicationRecord
  after_commit do |block|
    # called in rails5.2.x
    # doesn't called in rails6.0.0
    # binding.irb
  end
  include AfterCommitAction
  has_many :group_memberships, dependent: :destroy

  def add_member!(user)
    group_memberships.find_or_create_by!(user: user)
  end

  private def membership_added
    execute_after_commit {
      AddNotificationJob.perform_now
    }
  end
end
