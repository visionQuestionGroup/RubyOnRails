class UsersController < ApplicationController
  def register
    passhash = Digest::SHA1.hexdigest(params[:password])
    @user = User.new(user_name: params[:user_name],
                      first_name: params[:first_name],
                      last_name: params[:last_name],
                      email: params[:email],
                     password: passhash)
    if @user.save
      render 'register.json.jbuilder', status: :created
    else 
      render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
    end
  end

  def login
    passhash = Digest::SHA1.hexdigest(params[:password])
    @user = User.find_by(user_name: params[:user_name], password: passhash)
    if @user
      render 'login.json.jbuilder', status: :created
    else 
      render json: { message: 'The username or password you supplied is incorrect.' },
        status: :unprocessable_entity
    end
  end

  def get_users

    @users = User.order(created_at: :desc).page(params[:page])
    if @users.any?
      render 'users.json.jbuilder', status: :ok
    else
      render json: { message: 'There are no users to display.' },
        status: :unprocessable_entity
    end

  end
end
