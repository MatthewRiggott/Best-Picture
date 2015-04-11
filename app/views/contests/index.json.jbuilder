json.array!(@contests) do |contest|
  json.extract! contest, :id, :user_id
  json.url contest_url(contest, format: :json)
end
