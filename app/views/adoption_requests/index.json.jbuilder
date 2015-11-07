json.array!(@adoption_requests) do |adoption_request|
  json.extract! adoption_request, :id, :owner_id, :pet_id, :status
  json.url adoption_request_url(adoption_request, format: :json)
end
