json.array!(@operas) do |opera|
  json.extract! opera, :id, :name, :year, :archive_index, :website_id, :image
  json.url opera_url(opera, format: :json)
end
