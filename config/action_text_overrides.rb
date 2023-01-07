module ActiveStorageBlobOverrides
  def attachable_plain_text_representation(caption = nil)
    ""
  end
end

Rails.configuration.to_prepare do
  ActiveStorage::Blob.send :prepend, ::ActiveStorageBlobOverrides
end