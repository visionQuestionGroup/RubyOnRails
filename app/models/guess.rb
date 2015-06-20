class Guess < ActiveRecord::Base
	belongs_to :user
	belongs_to :post

	def check_solution
		if self.post.answer == self.guess
			self.points = 30
			self.post.solution = self.id
			true
		else
			false
		end
	end
end
