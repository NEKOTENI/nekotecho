class AddUserIdToMemos < ActiveRecord::Migration
  def change
    add_column :memos, :user_id, :string
  end
end
