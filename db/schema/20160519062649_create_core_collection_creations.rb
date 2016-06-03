create_table :collection_creations, id: :bigserial do |t|
  t.references :collection, null: false, limit: 8, default: 0
  t.references :creation, null: false, limit: 8, default: 0

  t.timestamps null: false
end

add_foreign_key :collection_creations, :collections, column: 'collection_id', name: 'fk_collection_creations_collections'
add_foreign_key :collection_creations, :creations, column: 'creation_id', name: 'fk_collection_creations_creations'

add_index :collection_creations, 'collection_id', name: 'idx_collection_creations_collection_id'
add_index :collection_creations, 'creation_id', name: 'idx_collection_creations_creation_id'
