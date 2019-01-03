class Api::V1::UsersController < ApplicationController

  def create
    if User.find_by_uid(params[:uid])
      user = User.find_by_uid(params[:uid])
      render status: 200, json: UserSerializer.new(user).serialized_json
    else
      user = User.new(name: params[:name], uid: params[:uid])
      if user.save
        user.generate_api_key
        render status: 201, json: UserSerializer.new(user).serialized_json
      else
        render status: 400, json: { message: "Invalid request" }
      end
    end
  end

  def show
    user = User.find_by_id(params[:id])
    if user
      render json: UserSerializer.new(user).serialized_json
    else
      render status: 404, json: { message: "Unable to find user" }
    end
  end

end
