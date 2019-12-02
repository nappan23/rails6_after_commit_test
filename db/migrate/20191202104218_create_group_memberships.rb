class CreateGroupMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :group_memberships do |t|
      t.bigint :group_id
      t.bigint :user_id
      t.timestamps
    end
  end
end
