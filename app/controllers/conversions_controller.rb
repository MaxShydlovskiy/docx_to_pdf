class ConversionsController < ApplicationController
  def index
    @conversions = Conversion.all
  end
 
 def new
    @conversion = Conversion.new
 end
 
 def create
    @conversion = Conversion.new(conversion_params)
    
    if @conversion.save
#      Libreconv.convert("#{Rails.root}/public/uploads/conversion/attachment/#{@conversion.name}/#{@original_filename}", 
#                        "#{Rails.root}/public/uploads/conversion/attachment/#{@conversion.name}/#{@original_filename}")
      redirect_to conversions_path, notice: "The file #{@conversion.name} has been uploaded."
    else
      render "new"
    end
    
 end
 
 def destroy
    @conversion = Conversion.find(params[:id])
    @conversion.destroy!
    redirect_to conversions_path, notice:  "The file #{@conversion.name} has been deleted."
 end
 
 private

  def conversion_params
    params.require(:conversion).permit(:name, :attachment)
  end
end
