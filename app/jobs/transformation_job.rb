require 'libreconv'
class TransformationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    c = Conversion.all.last
    @path = c.attachment_url
    @root = "#{Rails.root}/public/"
    @pdf = ".pdf"
    doc_file = @root+@path
    pdf_file = @root+
    Libreconv.convert(@root+@path, @root+@path+@pdf)
  end
end
