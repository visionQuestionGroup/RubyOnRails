class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :image_url
    	t.string :user_name
    	t.string :answer
    	t.string :guess
    	t.string :solution

      t.timestamps null: false
    end
  end
end