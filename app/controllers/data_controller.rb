class DataController < ApplicationController
  def fresh_data
    render json: Signature.to_json
  end

  def signatures_by_day_this_week
    render json: Signature.by_day_this_week
  end
end
