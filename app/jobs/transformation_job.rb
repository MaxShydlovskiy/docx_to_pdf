require 'libreconv'
class TransformationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    c = Conversion.all.last
    @path = c.attachment_url
    @root = "#{Rails.root}/public/"
    Libreconv.convert(@root+@path, @root+@path)
  end
end
