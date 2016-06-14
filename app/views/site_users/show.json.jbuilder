site_user = @result[:site_user]

json.id site_user.id
json.user_id site_user.user_id

json.site_id site_user.site_id
json.image site_user.site_user_image.try(:image)
json.image site_user.site_user_image.try(:image)

json.nickname site_user.nickname
json.biography site_user.biography
json.tos_accepted site_user.tos_accepted
json.site_user_status do
  json.id site_user.site_user_status.id
  json.name site_user.site_user_status.name
end

json.owner @result[:owner]
