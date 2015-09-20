class Memo < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, :through=>:taggings

  # PaperClip用の設定
  has_attached_file :image,
                    :styles => { medium: "100×100>" }
  validates_attachment_content_type :image,
                                    :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  # メモが空でないか？
  validates :text, presence: true
  validates :user_id, presence: true
end
