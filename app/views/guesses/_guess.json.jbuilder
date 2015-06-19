json.(guess, :user_id, :post_id, :guess, :points)
json.(guess.post, :answer)

json.correct guess.post.answer == guess.guess 


json.guess_info do

	json.(guess, :guess, :user_id, :post_id, :points, :created_at)

end

json.creator do
	json.(guess.user.post, user_name, :first_name, :last_name, post_id, guesses_left, :points, won: ,"false")
end

# Any helpers available to views are available to the builder
json.content format_content(@message.content)
json.(@message, :created_at, :updated_at)

json.author do
  json.name @message.creator.name.familiar
  json.email_address @message.creator.email_address_with_name
  json.url url_for(@message.creator, format: :json)
end
4
if current_user.admin?
  json.visitors calculate_visitors(@message)
end

create_table "guesses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.string   "guess"
    t.integer  "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


create_table "posts", force: :cascade do |t|
    t.string   "image_url"
    t.integer  "user_id"
    t.string   "answer"
    t.integer  "solution"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  {
  "user_name": "whatever",
  "link_id": 22,
  "guesses_left": 3,
  "won": false
}

