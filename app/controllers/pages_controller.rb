class PagesController < ApplicationController
  def home

    @signature = Signature.new
    @signature_count = Signature.count
    @t = Signature.top_three_states
    gon.topThreeStates = @t
    gon.signatureCount = @signature_count
    @first_state = @t[0]
    @second_state = @t[1]
    @third_state = @t[2]
  end

  def about
  end
end
