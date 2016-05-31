json.array!(@creation_comments) do |creation_comment|
  json.extract! creation_comment, :id, :sid, :creation_id, :site_user_id, :body, :parent, :notice_code
  json.url creation_comment_url(creation_comment, format: :json)
end
