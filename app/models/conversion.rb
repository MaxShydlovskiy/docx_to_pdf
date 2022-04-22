class Conversion < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  validates :name, presence:
end
