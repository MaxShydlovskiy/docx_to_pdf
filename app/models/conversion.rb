class Conversion < ApplicationRecord
  has_one_attached :file

  def attach_file( base64mp3, guid_filename )
    # filename
    data_parts = base64mp3.match(/\Adata:([-\w]+\/[-\w\+\.]+)?;base64,(.*)/m) || []
    extension = MIME::Types[data_parts[1]].first.preferred_extension
    filename = guid_filename << ".#{extension}"
    
    # blob to file conversion
    data_index = data.index('base64') + 7
    filedata = data.slice(data_index, data.length)
    decoded_file = Base64.decode64(filedata)
  end
end
