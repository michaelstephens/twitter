class Tweet < ApplicationRecord
  has_many :replies
  validates :content, presence: true
  belongs_to :user
end
