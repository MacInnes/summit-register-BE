class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(name: params[:name])
    if user.save
      user.generate_api_key
      render status: 201, json: UserSerializer.new(user).serialized_json
    else
      render 400, json: { message: "Invalid request" }
    end
  end

  def show
    user = User.find(params[:id])
    if user
      render json: UserSerializer.new(user).serialized_json
    else
      render 404, json: { message: "Unable to find user" }
    end
  end

end
