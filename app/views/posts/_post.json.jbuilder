json.(post, :id)

json.post_info do
  json.(post, :image_url, :answer, :created_at, :updated_at)
end

json.creator do
  json.(post.user, :user_name, :first_name, :last_name, :email)
end