class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :memos, :through=>:taggings

  # タグ名が空でないか？
  validates :tag, presence: true
  validates :user_id, presence: true
end
