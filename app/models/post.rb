class Post < ActiveRecord::Base
	belongs_to :user
	has_many :guesses

  validates :user_id, presence: true
  validates :answer, presence: true
  validates :image_url, presence: true
end
