create_table :creation_tags, id: :bigserial do |t|
  t.references :creation, null: false, limit: 8, default: 0
  t.references :tag, null: false, limit: 8, default: 0

  t.timestamps null: false
  t.datetime :removed_at
  t.integer :removed_id, limit: 8, default: 0
end

add_foreign_key :creation_tags, :creations, column: 'creation_id', name: 'fk_creation_tags_creations'
add_foreign_key :creation_tags, :tags, column: 'tag_id', name: 'fk_creation_tags_tags'

add_index :creation_tags, 'creation_id', name: 'idx_creation_tags_creation_id'
add_index :creation_tags, 'tag_id', name: 'idx_creation_tags_tag_id'
add_index :creation_tags, ['creation_id', 'tag_id'], unique: true, name: 'idx_creatino_tags_creation_id_tag_id'
add_index :creation_tags, 'removed_id', name: 'idx_creation_tags_removed_id'
