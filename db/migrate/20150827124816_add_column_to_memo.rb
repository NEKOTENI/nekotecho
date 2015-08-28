class AddColumnToMemo < ActiveRecord::Migration
  def change
    add_column :memos, :tag_id, :integer
  end
end
