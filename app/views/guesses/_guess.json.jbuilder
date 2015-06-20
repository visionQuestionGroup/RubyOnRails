json.(guess, :user_id, :post_id, :guess, :points)
json.(guess.post, :answer)

json.correct guess.post.answer == guess.guess 
json.points guess.points

json.guess_info do
	json.(guess, :guess, :user_id, :post_id, :points, :created_at)
end

# json.creator do
# 	json.(guess.user.post, user_name, :first_name, :last_name, post_id, guesses_left, :points, won: ,"false")
# end


