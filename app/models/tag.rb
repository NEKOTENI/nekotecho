class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :memos, :through=>:taggings
end
