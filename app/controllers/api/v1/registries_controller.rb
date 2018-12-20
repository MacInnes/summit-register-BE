class Api::V1::RegistriesController < ApplicationController

  def create
    Registry.create(
      name: params[:name],
      hometown: params[:hometown],
      comments: params[:comments],
      mountain_id: params[:mountain_id]
    )
    render status: 201, json: {message: "Registry created." }
  end

end
