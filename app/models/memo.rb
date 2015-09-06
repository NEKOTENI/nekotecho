class Memo < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, :through=>:taggings

  # メモが空でないか？
  validates :text, presence: true
  validates :user_id, presence: true
end
