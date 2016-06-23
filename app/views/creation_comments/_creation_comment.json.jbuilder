if comment
  json.id comment.id
  json.site_user do
    json.partial! partial: '/site_users/site_user', locals: { site_user: comment.site_user }
  end
  json.body comment.body
  json.created_at comment.created_at
end
