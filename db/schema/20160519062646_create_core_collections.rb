create_table :collections, id: :bigserial do |t|
  t.string :sid, limit: 32, null: false
  t.references :site_user, null: false, limit: 8, default: 0
  t.string :title, limit: 200

  t.timestamps null: false
end

add_foreign_key :collections, :site_users, column: 'site_user_id', name: 'fk_collections_site_users'

add_index :collections, 'sid', unique: true, name: 'idx_collections_sid'
add_index :collections, 'site_user_id', name: 'idx_collections_site_user_id'

execute("ALTER TABLE collections ALTER COLUMN sid SET DEFAULT md5('collections' || nextval('collections_id_seq') || 'salt')")
