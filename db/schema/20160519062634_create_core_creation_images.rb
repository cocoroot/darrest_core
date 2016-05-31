create_table :creation_images, id: :bigserial do |t|
  t.integer :creation_id, null: false, limit: 8, default: 0
  t.string :image, limit: 2083
  t.string :image_name_for_user, limit: 256, null: false
  t.integer :order

  t.timestamps null: false
  t.datetime :removed_at
  t.integer :removed_id, limit: 8, default: 0
end

add_foreign_key :creation_images, :creations, column: 'creation_id', name: 'fk_creation_images_creations'

add_index :creation_images, 'creation_id', name: 'idx_creation_images_creation_id'
add_index :creation_images, 'removed_id', name: 'idx_creation_images_removed_id'
