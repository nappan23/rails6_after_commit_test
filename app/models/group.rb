class Group < ApplicationRecord
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
