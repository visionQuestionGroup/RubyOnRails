class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :user_name
    	t.string :first_name
    	t.string :last_name
    	t.string :email
      t.string :password
      t.string :access_token
      t.string :post
      t.string :guess


      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps null: false
    end
  end
end
