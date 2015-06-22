class GuessesController < ApplicationController
  before_action :authenticate_with_token!

  def new
    @guess = Guess.new( user_id: current_user.id,
                            post_id: params[:post_id],
                            guess: params[:guess])


    if self.not_solved && self.not_same_user_as_post
      if @guess.save
        @winner = @guess.check_solution
        @guesses = Post.find_by(id: params[:post_id]).guesses.where(user_id: current_user.id).count

        render 'new.json.jbuilder', status: :created
      else
        render json: { errors: @guess.errors.full_messages },
          status: :unprocessable_entity
      end
    elsif !self.not_solved
      render json: { message: "You cannot make a guess! You're too slow" },
        status: :unprocessable_entity
    elsif !self.not_same_user_as_post
      render json: { message: "You cannot make a guess on your own post. You are a cheater!" },
        status: :unprocessable_entity
    end
   
  end

  protected
    def not_solved
      post = @guess.post
      if post && !post.solution
        result = true
      else
       result = false
      end
      result
    end

    def not_same_user_as_post
      post = @guess.post.user
      if !@guess.post
        post_user = @guess.post.user
        if post_user && current_user != post_user
          result = true
        else
          result = false
        end
      else
        result = true
      end
      result
    end
end



