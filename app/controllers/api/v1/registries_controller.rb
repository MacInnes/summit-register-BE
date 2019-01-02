class Api::V1::RegistriesController < ApplicationController

  def create
    registry = Registry.new(
      name: params[:name],
      hometown: params[:hometown],
      comments: params[:comments],
      mountain_id: params[:mountain_id],
      user_id: get_user,
      sign_time: params[:sign_time]
    )
    if registry.save
      mountain = Mountain.find(registry.mountain_id)
      render json: RegistrySerializer.new(mountain.registries).serialized_json
    else
      render status: 400, json: {message: "Invalid request, missing required parameters."}
    end
  end

  private

  def get_user
    if params[:api_key]
      User.find_by_api_key(params[:api_key]).id
    else
      User.first.id
    end
  end

end
