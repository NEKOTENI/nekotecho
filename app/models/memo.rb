class Memo < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, :through=>:taggings

  # メモが空だったらエラーメッセージを出すバリデーションを書くこと。
end
