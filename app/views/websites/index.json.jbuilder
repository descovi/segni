json.array!(@websites) do |website|
  json.extract! website, :id, :name, :name-slug, :primary_color, :secondary_color
  json.url website_url(website, format: :json)
end
