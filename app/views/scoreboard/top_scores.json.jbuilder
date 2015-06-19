json.array! @top_users.each_pair do |user, score|
  json.user_name user
  json.score score
end