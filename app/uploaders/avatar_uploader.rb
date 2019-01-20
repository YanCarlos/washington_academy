require 'image_processing/mini_magick'

class AvatarUploader < Shrine
  plugin :remove_attachment
  plugin :pretty_location
  plugin :processing
  plugin :versions
  plugin :validation_helpers
  plugin :cached_attachment_data
  plugin :restore_cached_data
  plugin :validation_helpers
  plugin :determine_mime_type
  plugin :delete_raw # delete processed files after uploading
  plugin :data_uri

  ALLOWED_TYPES = %w[image/jpg image/jpeg image/png]

  Attacher.validate do
    validate_mime_type_inclusion ALLOWED_TYPES
  end

  process(:store) do |io|
    versions = { original: io } # retain original

    io.download do |original|
      pipeline = ImageProcessing::MiniMagick.source(original)

      versions[:medium] = pipeline.resize_to_limit!(200, nil)
      versions[:small]  = pipeline.resize_to_limit!(100, nil)
    end

    versions # return the hash of processed files
  end

  def generate_location(io, context)
    class_name  = context[:record].class.name.downcase
    role =  context[:record].roles.first.name
    id =  context[:record].id
    file_name = io.original_filename

    [class_name, role, id, file_name].compact.join('/')
  end  
  
end
