class PagesController < ApplicationController
  def home
    @signature = Signature.new
    @signature_count = Signature.count

    @first_state = Signature.first_state
    @second_state = Signature.second_state
    @third_state = Signature.third_state
  end

  def about
  end
end
