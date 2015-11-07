json.array!(@discussions) do |discussion|
  json.extract! discussion, :id, :topic, :content, :discussion_type, :breed
  json.url discussion_url(discussion, format: :json)
end
