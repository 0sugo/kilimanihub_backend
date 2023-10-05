class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: {status: "Success",message: "Users fetched successfully",data: @users }, status: :ok
 end

 def show
  @individual_user = User.find(params[:id])
  @posts = @individual_user.posts

  render json: { status: "Success",message: "User's posts fetched successfully",user: @individual_user,posts: @posts}, status: :ok
  rescue ActiveRecord::RecordNotFound
  render json: { error: "User not found" }, status: :not_found
end
end
