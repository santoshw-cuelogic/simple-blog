json.array!(@articles) do |article|
  json.extract! article, :id, :subject, :description, :status, :posted_at
  json.url article_url(article, format: :json)
end
