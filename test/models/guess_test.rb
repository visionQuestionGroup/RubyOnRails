require 'test_helper'

class GuessTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "must have a guess present" do
    guess = Guess.new(post_id: 1, user_id: 1)
    refute guess.save
  end

  test "must have a post id" do
    guess = Guess.new(guess: "hello", user_id: 1)
    refute guess.save
    guess = Guess.new(guess: "hello", user_id: 1, post_id: 1)
    assert guess.save
  end
  
end
