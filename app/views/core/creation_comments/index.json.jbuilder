json.array!(@core_creation_comments) do |core_creation_comment|
  json.extract! core_creation_comment, :id, :sid, :creation_id, :user_id, :parent_id, :notice_code
  json.url core_creation_comment_url(core_creation_comment, format: :json)
end
