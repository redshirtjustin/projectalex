json.array!(@stories) do |story|
  json.extract! story, :id, :headline, :leadline, :shortline, :mast_url, :thumb_url, :section_id, :priority_id, :pipeline_id
  json.url story_url(story, format: :json)
end
