json.array!(@disucssions) do |disucssion|
  json.extract! disucssion, :id, :topic, :content, :type, :breed
  json.url disucssion_url(disucssion, format: :json)
end
