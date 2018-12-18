class WelcomeController < ApplicationController

  def index
    render json: {'message': 'Welcome to Summit Registry!'}
  end

end
