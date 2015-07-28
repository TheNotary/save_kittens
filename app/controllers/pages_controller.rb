class PagesController < ApplicationController
  def home
    @signature = Signature.new
  end

  def about
  end
end
