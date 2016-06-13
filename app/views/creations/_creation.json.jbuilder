json.id creation.id

json.site_id creation.site_id
json.site_user do
  json.user_id creation.site_user.user_id
  json.site_user_id creation.site_user_id
  json.image creation.site_user.site_user_image.try(:image)
end

json.title creation.title
json.description creation.description
json.creation_status creation.creation_status.creation_status

json.creation_images do
  json.array! creation.creation_images, :id, :image, :image_name_for_user
end

json.creation_pieces do
  json.array! creation.creation_pieces, :id, :name, :file, :file_name_for_user, :format, :image, :image_name_for_user
end

json.creation_tags do
  json.array! creation.creation_tags.for_users.map { |item| item.tag.name }
end

json.goods creation.goods.count

json.creation_comments do
  json.array! creation.creation_comments do |comment|
    json.id comment.id
    json.site_user do
      json.user_id comment.site_user.user_id
      json.site_user_id comment.site_user_id
      json.image comment.site_user.site_user_image.try(:image)
    end
    json.body comment.body
    json.created_at comment.created_at
  end
end
