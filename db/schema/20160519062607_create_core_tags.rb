create_table :tags, id: :bigserial do |t|
  t.string :name, limit: 100
  t.integer :tag_class_id, null: false, default: 0
  t.integer :site_id, null: false, default: 0

  t.timestamps null: false
end

add_index :tags, ['name', 'site_id'], unique: true, name: 'idx_tags_name_site_id'
add_index :tags, ['site_id'], name: 'idx_tags_site_id', using: :btree
add_index :tags, ['tag_class_id'], name: 'idx_tags_tag_class_id', using: :btree

add_foreign_key :tags, :sites, column: 'site_id', name: 'fk_tags_sites'
add_foreign_key :tags, :tag_classes, column: 'tag_class_id', name: 'fk_tags_tag_classes'
