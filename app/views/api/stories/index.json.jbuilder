json.array!(@stories) do |story|
  json.extract! story, :id, :subject, :headline, :leadline, :shortline, :mast_url, :thumb_url, :section_id, :priority_id, :created_at, :updated_at
end
