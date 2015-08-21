class RemoveUserIdFromMemos < ActiveRecord::Migration
  def change
    remove_column :memos, :user_id, :string
  end
end
