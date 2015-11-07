json.array!(@pets) do |pet|
  json.extract! pet, :id, :type, :breed, :gender, :age, :name, :area, :color, :location
  json.url pet_url(pet, format: :json)
end
