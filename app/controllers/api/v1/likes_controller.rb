class Api::V1::LikesController < ApplicationController
  before_action :find_post, :find_user

  # POST /api/v1/users/:user_id/posts/:post_id/like
  def create
    like = Like.new(post: @post, author: @user)

    if like.save
      @post.increment!(:likes_counter) # Increment likes_counter for the post
      render json: {
        status: "Success",
        message: "Post liked successfully",
        data: like
      }, status: :created
    else
      render json: {
        status: "Error",
        message: "Failed to like the post",
        errors: like.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
