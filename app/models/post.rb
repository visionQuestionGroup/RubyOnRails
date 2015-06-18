class Post < ActiveRecord::Base
	belongs_to :user
	has_one :answer
	has_many :guesses
	has_one :solution through :guesses
end
