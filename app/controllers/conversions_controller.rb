class ConversionsController < ApplicationController
  def index
    @conversion = Conversion.new
  end

end
