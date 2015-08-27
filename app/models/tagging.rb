class Tagging < ActiveRecord::Base
  belongs_to :memo
  belongs_to :Tag
end
