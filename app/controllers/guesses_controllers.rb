class GuessesController < ApplicationController

  def new
    @guess = post.guess.create(post_id: params[:post_id])
  end

end