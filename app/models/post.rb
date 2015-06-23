class Post < ActiveRecord::Base
  IMAGE_REGEX = /\Ahttps?:\/\/(?:[a-zA-z0-9\-]+\.)+[a-z]{2,20}(?:\/[^\/#?]+)+\.(?:jpg|gif|png)\z/
	belongs_to :user
	has_many :guesses

  validates :user_id, presence: true
  validates :answer, presence: true
  validates :image_url, presence: true
  validates :last_name, format: { with: IMAGE_REGEX, 
                                  message: "not a valid url for an image"}
end
