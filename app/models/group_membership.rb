class GroupMembership < ApplicationRecord
  belongs_to :group
  belongs_to :user
  after_create :run_membership_added_hook

  private def run_membership_added_hook
    group&.__send__(:membership_added)
  end
end
