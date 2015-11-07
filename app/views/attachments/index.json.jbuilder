json.array!(@attachments) do |attachment|
  json.extract! attachment, :id, :attachable_id, :attachable
  json.url attachment_url(attachment, format: :json)
end
