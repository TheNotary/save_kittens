class DataController < ApplicationController
  def fresh_data
    render json: Signature.to_json
  end
end
