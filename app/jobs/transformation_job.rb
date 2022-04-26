require 'libreconv'
class TransformationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    c = Conversion.all.last
    @path = c.attachments_url[0]
    @root = "#{Rails.root}/public/"
    @pdf = ".pdf"
    doc_file = @root+@path
    pdf_file = @root+@path+@pdf
    Libreconv.convert(doc_file, pdf_file)
  end
end
