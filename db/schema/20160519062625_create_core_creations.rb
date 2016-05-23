create_table :creations, id: :bigserial do |t|
  t.string :sid, limit: 32, null: false
  t.references :site_user, null: false, limit: 8, default: 0
  t.string :title, limit: 200
  t.string :description, limit: 10000
  t.string :license_code
  t.references :creation_status

  t.timestamps null: false
end

add_foreign_key :creations, :site_users, column: 'site_user_id', name: 'fk_creations_site_users'
add_foreign_key :creations, :creation_statuses, column: 'creation_status_id', name: 'fk_creations_creation_statuses'

add_index :creations, 'sid', unique: true, name: 'idx_creations_sid'
add_index :creations, 'site_user_id', name: 'idx_creations_site_user_id'
add_index :creations, 'creation_status_id', name: 'idx_creations_creation_status_id'

execute("ALTER TABLE creations ALTER COLUMN sid SET DEFAULT md5('creations' || nextval('creations_id_seq') || 'salt')")
