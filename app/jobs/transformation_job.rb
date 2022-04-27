require 'libreconv'

class TransformationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    c = Conversion.all.last
    @path = c.doc_file_url
    @root = "#{Rails.root}/public/"
    @pdf = ".pdf"
    d_file = @root+@path
    p_file = @root+@path+@pdf
    Libreconv.convert(d_file, p_file)

    c = Conversion.all.last
    @pdf_file = p_file

    File.open(@pdf_file) do |f|
      c.pdf_file = f
    end
    c.save!
  end
end

# /home/pixus/workspace/docx_to_pdf/public/uploads/conversion/file/4/test.doc
# public/uploads/conversion/file/4/test.doc