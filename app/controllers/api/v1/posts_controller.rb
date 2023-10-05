class Api::V1::PostsController < ApplicationController
  def index
    def index
      user = User.find(params[:user_id])
      @posts = user.posts.includes(:author, comments: :author).order(created_at: :desc)
      render json: { status: "Success", message: "Posts successfully fetched", data: @posts }, status: :ok
    end
  end

  def show
    user = User.find(params[:user_id])
    @post = user.posts.find(params[:id])
    @comments = @post.comments.order(created_at: :desc)

    render json: {
      status: "Success",
      message: "Post and comments successfully fetched",
      post: @post,
      comments: @comments
    }, status: :ok
  end

  def create
    user = User.find(params[:user_id])
    @post = user.posts.build(post_params)

    if @post.save
      render json: {
        status: "Success",
        message: "Post successfully created",
        data: @post
      }, status: :created
    else
      render json: {
        status: "Error",
        message: "Failed to create post",
        errors: @post.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:user_id])
    @post = user.posts.find(params[:id])

    if @post.destroy
      render json: {
        status: "Success",
        message: "Post successfully deleted",
        data: @post
      }, status: :ok
    else
      render json: {
        status: "Error",
        message: "Failed to delete post",
        errors: @post.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
