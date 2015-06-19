class PostsController < ApplicationController
  before_action :authenticate_with_token!

  def new
    @post = current_user.posts.new( image_url: params[:image_url],
                                    answer: params[:answer] )
    if @post.save
      render 'new.json.jbuilder', status: :ok
    else
    render json: { errors: @post.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def show
    @post = current_user.posts.find_by(id: params[:id])
    if @post
      render 'show.json.jbuilder', status: :ok
    else
      render json: { message: "This user does not have a post with that ID." },
        status: :not_found
    end
  end

  def user_posts
    @posts = current_user.posts.all
    if @posts.any?
      render 'user_posts.json.jbuilder', status: :ok
    else
      render json: { message: "This user does not have any posts." },
        status: :not_found
    end
  end

  def all
    @posts = Post.all
    if @posts.any?
      render 'all.json.jbuilder', status: :ok
    else
      render json: { message: "There are no posts." },
        status: :not_found
    end
  end

end