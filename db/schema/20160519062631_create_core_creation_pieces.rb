create_table :creation_pieces, id: :bigserial do |t|
  t.references :creation, null: false, limit: 8, default: 0
  t.string :name, limit: 200
  t.string :dscription, limit: 300
  t.string :file_name, limit: 512
  t.string :format, limit: 10
  t.string :image, limit: 2083

  t.timestamps null: false
end

add_foreign_key :creation_pieces, :creations, column: 'creation_id', name: 'fk_creation_pieces_creations'

add_index :creation_pieces, 'creation_id', name: 'idx_creation_pieces_creation_id'
