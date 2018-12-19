class Api::V1::MountainsController < ApplicationController

  def index
    mountains = Mountain.all
    render json: MountainSerializer.new(mountains)
  end

  def show
    mountain = Mountain.find(params[:id])
    render json: MountainSerializer.new(mountain)
  end

end
