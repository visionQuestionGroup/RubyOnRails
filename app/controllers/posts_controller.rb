class PostsController < ApplicationController
  before_action :authenticate_with_token!, only: [:new, :show, :user_posts]

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
    @posts = current_user.posts.order(created_at: :desc).page(params[:page])
    if @posts.any?
      render 'user_posts.json.jbuilder', status: :ok
    else
      render json: { message: "This user does not have any posts." },
        status: :not_found
    end
  end

  def user_posts_not_solved
    @posts = current_user.posts.where(solution: nil).order(created_at: :desc).page(params[:page])
    if @posts.any?
      render 'user_posts.json.jbuilder', status: :ok
    else
      render json: { message: "This user does not have any posts." },
        status: :not_found
    end
  end

  def user_posts_solved
    @posts = current_user.posts.where.not(solution: nil).order(created_at: :desc).page(params[:page])
    if @posts.any?
      render 'user_posts.json.jbuilder', status: :ok
    else
      render json: { message: "This user does not have any posts." },
        status: :not_found
    end
  end

  def all
    @posts = Post.order(created_at: :desc).page(params[:page])
    if @posts.any?
      render 'all.json.jbuilder', status: :ok
    else
      render json: { message: "There are no posts." },
        status: :not_found
    end
  end

  def all_playable
    @posts = Post.where(solution: nil).order(created_at: :desc).page(params[:page])
    if @posts.any?
      render 'all.json.jbuilder', status: :ok
    else
      render json: { message: "There are no posts." },
        status: :not_found
    end
  end

  def all_unplayable
    @posts = Post.where.not(solution: nil).order(created_at: :desc).page(params[:page])
    if @posts.any?
      render 'all.json.jbuilder', status: :ok
    else
      render json: { message: "There are no posts." },
        status: :not_found
    end
  end

end