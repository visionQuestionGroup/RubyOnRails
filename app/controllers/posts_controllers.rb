class UsersController < ApplicationController

  def new
    @user = User.find_by(user_name: params[:user_name])
    @post = @user.posts.create(image_url: params[:image_url], answer: params[:answer])
  end

  def show
    @user = User.find_by(user_name: params[:user_name])
    @post = @user.posts.find(params[:id])
  end

  def user_posts
    @user = User.find_by(user_name: params[:user_name])
    @posts = @user.posts.all
  end

  def all
    @posts = Post.all
  end

end