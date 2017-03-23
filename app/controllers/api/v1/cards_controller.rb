class Api::V1::CardsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render json: Card.all
  end
end
