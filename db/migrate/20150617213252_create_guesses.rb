class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
    	t.string :user_name
    	t.integer :post_id
    	t.string :guess
    	t.string :point_total


      t.timestamps null: false
    end
  end
end