json.array!(@signatures) do |signature|
  json.extract! signature, :id, :name, :email, :zip, :state, :subscriber
  json.url signature_url(signature, format: :json)
end
