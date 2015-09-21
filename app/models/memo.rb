class Memo < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, :through=>:taggings

  has_attached_file :image,
                    :styles => { medium: "400x400>" },
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => ":attachment/:id/:style.:extension"
  validates_attachment_content_type :image,
                                    :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  # メモが空でないか？
  validates :text, presence: true
  validates :user_id, presence: true
end