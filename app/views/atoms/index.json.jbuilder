json.array!(@atoms) do |atom|
  json.extract! atom, :id
  json.url atom_url(atom, format: :json)
end
