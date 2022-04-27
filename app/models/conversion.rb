class Conversion < ApplicationRecord
  mount_uploader :doc_file, DocfileUploader
  mount_uploader :pdf_file, PdfFileUploader
end
