json.array!(@manage_creation_comments) do |manage_creation_comment|
  json.extract! manage_creation_comment, :id, :sid, :creation_id, :user_id, :parent_id, :notice_code
  json.url manage_creation_comment_url(manage_creation_comment, format: :json)
end
