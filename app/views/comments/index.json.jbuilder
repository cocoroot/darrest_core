json.array!(@comments) do |comment|
  json.extract! comment, :id, :sid, :creation_id, :site_user_id, :body, :parent, :notice_code
  json.url comment_url(comment, format: :json)
end
