create_table :creation_tags, id: :bigserial do |t|
  t.references :creation, null: false, limit: 8, default: 0
  t.references :tag, null: false, limit: 8, default: 0

  t.timestamps null: false
end

add_foreign_key :creation_tags, :creations, column: 'creation_id', name: 'fk_creation_tags_creations'
add_foreign_key :creation_tags, :tags, column: 'tag_id', name: 'fk_creation_tags_tags'

add_index :creation_tags, 'creation_id', name: 'idx_creation_tags_creation_id'
add_index :creation_tags, 'tag_id', name: 'idx_creation_tags_tag_id'
