json.array!(@comments) do |comment|
  json.extract! comment, :id, :article_id, :guest_name, :guest_email, :comment, :comment_date
  json.url comment_url(comment, format: :json)
end
