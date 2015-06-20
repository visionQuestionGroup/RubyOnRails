json.array! @users do |user|
  json.(user, :user_name, :first_name, :last_name, :email, :created_at)
end