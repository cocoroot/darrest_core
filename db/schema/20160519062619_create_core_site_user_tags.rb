create_table :site_user_tags, id: :bigserial do |t|
  t.references :site_user, null: false, limit: 8, default: 0
  t.references :tag, null: false, limit: 8, default: 0

  t.timestamps null: false
end

add_index :site_user_tags, 'site_user_id', name: 'idx_site_user_tags_site_user_id'
add_index :site_user_tags, 'tag_id', name: 'idx_site_user_tags_tag_id'

add_foreign_key :site_user_tags, :site_users, column: 'site_user_id', name: 'fk_site_user_tags_site_users'
add_foreign_key :site_user_tags, :tags, column: 'tag_id', name: 'fk_site_user_tags_tags'

