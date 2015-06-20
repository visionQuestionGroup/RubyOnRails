class GuessesController < ApplicationController
  before_action :authenticate_with_token!

  def new
    @guess = Guess.new( user_id: current_user.id,
                            post_id: params[:post_id],
                            guess: params[:guess])
    if @guess.save
      @winner = @guess.check_solution
      @guesses = current_user.posts.find_by(id: params[:post_id]).guesses.count

      render 'new.json.jbuilder', status: :created
    else
      render json: { errors: @guess.errors.full_messages },
      status: :unprocessable_entity
    end
  end 
end