class DataController < ApplicationController
  def fresh_data
    render json: Signature.fresh_data
  end

  def signatures_by_day_this_week
    render json: Signature.by_day_this_week
  end

  def version
    render text: SaveKittens::Application::VERSION
  end
end
