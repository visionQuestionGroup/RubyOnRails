class GuessesController < ApplicationController
  before_action :authenticate_with_token!

  def new
    @guess = post.guess.new( user_id: params[:user_id],
                            post_id: params[:post_id],
                            guess: params[:guess],
                            points: params[:points])
    if @guess.save
      render 'new.json.jbuilder', status: :created
    else
      render json: { errors: @guess.errors.full_messages },
        status: :unprocessable_entity
    end
  end
end


def show
    @guess = current_user.post.guesses.find_by(id: params[:id])
    if @guess
      render 'show.json.jbuilder', status: :created
    else
      render json: { message: "This user does not have a post with that ID." },
        status: :not_found
    end
  end

  def user_guesses
    @guesses = current_user.post.guesses.all
    if @guesses.any?
      render 'user_guesses.json.jbuilder', status: :created
    else
      render json: { message: "This user does not have any posts." },
        status: :not_found
    end
  end



  def all
    @guesses = Post.all
    if @guesses.any?
      render 'all.json.jbuilder', status: :created
    else
      render json: { message: "There are no posts." },
        status: :not_found
    end
  end

end
