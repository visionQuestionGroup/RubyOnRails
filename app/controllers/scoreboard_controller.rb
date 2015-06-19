class ScoreboardController < ApplicationController

  def top_scores
    @top_users = User.joins(:guesses).group(:user_name).order("sum_points DESC")
                  .limit(10).sum(:points)
    if @top_users.any?
      @top_user.each_
      render 'top_scores.json.jbuilder', status: :ok
    else
      render json: { message: "Sorry no scores to display." },
        status: :not_found
    end
  end

end

