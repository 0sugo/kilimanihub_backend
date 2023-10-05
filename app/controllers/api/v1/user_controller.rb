class Api::V1::UserController < ApplicationController
  def index
    @users = User.all
    render json:{status:"Success",message:"Users fetched succesfully",data:@data},status: :ok
  end

  def show
  end
end
