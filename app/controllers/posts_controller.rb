class PostsController < ApplicationController

  def new
    @post = current_user.post.new( image_url: params[:image_url],
                                    answer: params[:answer] )
    if @post.save
      render 'new.json.jbuilder', status: :created
    else
      puts "nope"
    end
  end

  # def show
  #   @user = User.find_by(user_name: params[:user_name])
  #   @post = @user.posts.find(params[:id])
  #     render 'show.json.jbuilder', status: :created
  # end

  # def user_posts
  #   @posts = current_user.posts.all
  #   render 'user_posts.json.jbuilder', status: :created
  # end

  # def all
  #   @posts = Post.all
  #   render 'all.json.jbuilder', status: :created
  # end

end