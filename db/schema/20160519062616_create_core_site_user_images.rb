create_table :site_user_images, id: :bigserial do |t|
  t.references :site_user, null: false, limit: 8, default: 0
  t.string :image, limit: 2083
  t.string :image_name_for_user, limit: 256

  t.timestamps null: false
end

add_foreign_key :site_user_images, :site_users, column: 'site_user_id', name: 'fk_site_user_images_site_users'

add_index :site_user_images, 'site_user_id', name: 'idx_site_user_images_site_user_id'
