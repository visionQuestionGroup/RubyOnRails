class ScoreboardController < ApplicationController
  before_action: authenticate_with_token!, only: [:total_user_score]

  def top_scores
    @top_users = User.joins(:guesses).group(:user_name).order("sum_points DESC")
                  .page(params[:page]).per(10).sum(:points)
    if @top_users.any?
      render 'top_scores.json.jbuilder', status: :ok
    else
      render json: { message: "Sorry no scores to display." },
        status: :unprocessable_entity
    end
  end

  def total_score_user
    @score = current_user.guesses.sum(:points)
    render 'total_user_score.json.jbilder', status: :ok
  end

end

