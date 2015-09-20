class RemoveImageFromMemos < ActiveRecord::Migration
  def change
    remove_column :memos, :image, :string
  end
end
