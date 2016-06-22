create_table :creation_pieces, id: :bigserial do |t|
  t.references :creation, null: false, limit: 8, default: 0
  t.string :name, limit: 200
  t.string :file, null: false, limit: 2083
  t.string :file_name_for_user, limit: 256
  t.string :format, limit: 10
  t.string :image, limit: 2083
  t.string :image_name_for_user, limit: 256

  t.timestamps null: false
  t.datetime :removed_at
  t.integer :removed_id, limit: 8, default: 0
end

add_foreign_key :creation_pieces, :creations, column: 'creation_id', name: 'fk_creation_pieces_creations'

add_index :creation_pieces, 'creation_id', name: 'idx_creation_pieces_creation_id'
add_index :creation_pieces, 'removed_id', name: 'idx_creation_pieces_removed_id'
