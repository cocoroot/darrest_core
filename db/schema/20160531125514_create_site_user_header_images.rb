create_table :site_user_header_images, id: :bigserial do |t|
  t.references :site_user, null: false, limit: 8, default: 0
  t.string :image, limit: 2083
  t.string :image_name_for_user, limit: 256

  t.timestamps null: false
  t.datetime :removed_at
  t.integer :removed_id, limit: 8, default: 0
end

add_foreign_key :site_user_header_images, :site_users, column: 'site_user_id', name: 'fk_site_user_header_images_site_users'

add_index :site_user_header_images, 'site_user_id', name: 'idx_site_user_header_images_site_user_id'
add_index :site_user_header_images, 'removed_id', name: 'idx_site_user_header_images_removed_id'
