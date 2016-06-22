json.id creation.id

json.site_id creation.site_id
json.site_user do
  json.partial! partial: '/site_users/site_user', locals: { site_user: creation.site_user }
end

json.title creation.title
json.description creation.description
json.creation_status do
  json.id creation.creation_status.id
  json.code creation.creation_status.creation_status
  json.name creation.creation_status.name
end

json.creation_images do
  json.array! creation.creation_images, :id, :image, :image_name_for_user
end

json.creation_pieces do
  json.array! creation.creation_pieces, :id, :name, :file, :file_name_for_user, :format, :image, :image_name_for_user
end

json.creation_tags do
  json.array! creation.creation_tags.for_users.map { |item| item.tag.name }
end

json.goods_count creation.goods.count

json.creation_comments_count creation.creation_comments.count
json.creation_comments do
  json.partial! partial: '/creation_comments/creation_comment', collection: creation.creation_comments.order(id: :desc).take(Settings.creations.comments_per_page), as: :comment
end

json.published_at creation.published_at

json.owner creation.site_user_id == requester_site_user_id

json.partial! partial: '/goods/good', locals: { creation: creation }
