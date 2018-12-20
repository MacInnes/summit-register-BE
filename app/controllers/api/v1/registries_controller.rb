class Api::V1::RegistriesController < ApplicationController

  def create
    registry = Registry.new(
      name: params[:name],
      hometown: params[:hometown],
      comments: params[:comments],
      mountain_id: params[:mountain_id]
    )
    if registry.save
      mountain = Mountain.find(registry.mountain_id)
      render json: MountainSerializer.new(mountain).serialized_json
    else
      render status: 400, json: {message: "Invalid request, missing required parameters."}
    end
  end

end
