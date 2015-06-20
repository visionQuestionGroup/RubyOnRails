json.(guess, :user_id, :post_id, :guess, :points)
json.(guess.post, :answer)

json.guess_info do
  json.(guess, :guess, :user_id, :post_id, :points, :created_at)
end

json.creator do
  json.(guess.curent_user.post, user_name, :first_name, :last_name, post_id, points)
end


