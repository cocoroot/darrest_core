json.id @result[:creation].id

json.site_id @result[:creation].site_id
json.site_user do
  json.user_id @result[:creation].site_user.user_id
  json.site_user_id @result[:creation].site_user_id
  json.image @result[:creation].site_user.using_site_user_image.try(:image)
end

json.title @result[:creation].title
json.description @result[:creation].description
json.creation_status @result[:creation].creation_status.creation_status

json.creation_images do
  json.array! @result[:creation].creation_images, :id, :image, :image_name_for_user
end

json.creation_pieces do
  json.array! @result[:creation].creation_pieces, :id, :name, :file, :file_name_for_user, :format, :image, :image_name_for_user
end

json.creation_tags do
  json.array! @result[:creation].creation_tags.for_users.map { |item| item.tag.name }
end

json.goods @result[:creation].goods.count

json.comments do
  json.array! @result[:creation].comments do |comment|
    json.id comment.id
    json.site_user do
      json.user_id comment.site_user.user_id
      json.site_user_id comment.site_user_id
      json.image comment.site_user.using_site_user_image.try(:image)
    end
    json.body comment.body
    json.created_at comment.created_at
  end
end
