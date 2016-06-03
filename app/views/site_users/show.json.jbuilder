json.id @result[:site_user].id
json.user_id @result[:site_user].user_id

json.site_id @result[:site_user].site_id
json.image @result[:site_user].site_user_image.try(:image)
json.image @result[:site_user].site_user_image.try(:image)

json.biography @result[:site_user].biography
json.tos_accepted @result[:site_user].tos_accepted
json.site_user_status do
  json.id @result[:site_user].site_user_status.id
  json.name @result[:site_user].site_user_status.name
end
