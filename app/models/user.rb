class User < ApplicationRecord
  include AfterCommitAction
  after_create :membership_added

  private def membership_added
    execute_after_commit {
      AddNotificationJob.perform_now
    }
  end
end
