class Api::V1::MountainsController < ApplicationController

  def index
    mountains = Mountain.all
    render json: MountainSerializer.new(mountains).serialized_json
  end

  def show
    mountain = Mountain.find(params[:id])
    render json: MountainSerializer.new(mountain).serialized_json
  end

end
