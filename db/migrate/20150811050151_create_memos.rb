class CreateMemos < ActiveRecord::Migration
  def change
    create_table :memos do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.text :image
      t.text :text

      t.timestamps null: false
    end
  end
end
