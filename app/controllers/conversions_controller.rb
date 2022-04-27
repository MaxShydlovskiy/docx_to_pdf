class ConversionsController < ApplicationController
  def index
    @conversions = Conversion.all
  end
 
 def new
    @conversion = Conversion.new
 end
 
 def create
    @conversion = Conversion.new(conversion_params)
    # TransformationJob.perform_now
    
    if @conversion.save
      redirect_to conversions_path, notice: "The file #{@conversion.name} has been uploaded."
    else
      render "new"
    end
    
 end

 def edit
 end

 def update
  @conversion = Conversion.find(params[:id])
  if @conversion.update(conversion_params)
    flash.notice = "Uploading information was succesfully updating"
    redirect_to conversions_path
  else
    flash.now.alert = "Something went wrong. Please try updating again!"
  end
 end
 
 private

  def conversion_params
    params.require(:conversion).permit(:name, :doc_file, :pdf_file)
  end
end
