class Api::V1::RegistriesController < ApplicationController

  def create
    registry = Registry.new(
      name: params[:name],
      hometown: params[:hometown],
      comments: params[:comments],
      mountain_id: params[:mountain_id],
      sign_time: params[:sign_time]
    )
    if registry.save
      mountain = Mountain.find(registry.mountain_id)
      render json: RegistrySerializer.new(mountain.registries).serialized_json
    else
      render status: 400, json: {message: "Invalid request, missing required parameters."}
    end
  end

end
