class Api::V1::CommentsController < ApplicationController
  before_action :find_post, only: [:create, :destroy]
  before_action :find_comment, only: [:destroy]

  # POST /api/v1/users/:user_id/posts/:post_id/comments
  def create
    user = User.find(params[:user_id])
    @comment = @post.comments.build(comment_params)
    @comment.author = user
    
    if @comment.save
      render json: {
        status: "Success",
        message: "Comment successfully created",
        data: @comment
      }, status: :created
    else
      render json: {
        status: "Error",
        message: "Failed to create comment",
        errors: @comment.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/:user_id/posts/:post_id/comments/:id
  def destroy
    if @comment.destroy
      render json: {
        status: "Success",
        message: "Comment successfully deleted",
        data: @comment
      }, status: :ok
    else
      render json: {
        status: "Error",
        message: "Failed to delete comment",
        errors: @comment.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end

