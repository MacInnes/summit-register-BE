class Api::V1::RegistriesController < ApplicationController

  def create
    registry = Registry.new(
      name: params[:name],
      hometown: params[:hometown],
      comments: params[:comments],
      mountain_id: params[:mountain_id]
    )
    if registry.save
      render status: 201, json: {message: "Registry created." }
    else
      render status: 400, json: {message: "Invalid request, missing required parameters."}
    end
  end

end
