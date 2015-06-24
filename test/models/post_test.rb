require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "a post must have a user" do
  	@post = Post.new
    refute @post.save, "no user id present"
  end

  test "a post must have an answer" do
  	@post = Post.new(user_id: "girl",
			image_url: "rocktransformed.s3.amazonaws.com/testImage")
	refute @post.save, "no answer present"
	end

	test "a post must have a valid url" do
  	@post = Post.new(user_id: "girl",
			image_url: "rocktransformedtestImage")
	refute @post.save, "url not in valid format"
	end

	test "a post must have a image_url" do
  	@post = Post.new(user_id: "girl",
			answer: "party")
	refute @post.save, "no image_url present"
	end
	
end
