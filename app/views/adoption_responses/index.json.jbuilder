json.array!(@adoption_responses) do |adoption_response|
  json.extract! adoption_response, :id, :adoption_request_id, :owner_id
  json.url adoption_response_url(adoption_response, format: :json)
end
