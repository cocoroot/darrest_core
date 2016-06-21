create_table :creations, id: :bigserial do |t|
  t.string :sid, limit: 32
  t.references :site, null: false, default: 0
  t.references :site_user, null: false, limit: 8, default: 0
  t.string :title, limit: 200, default: ''
  t.string :description, limit: 10000, default: ''
  t.string :license_code
  t.references :creation_status, default: 1
  t.datetime :published_at, default: nil

  t.timestamps null: false
end

add_foreign_key :creations, :sites, column: 'site_id', name: 'fk_creations_sites'
add_foreign_key :creations, :site_users, column: 'site_user_id', name: 'fk_creations_site_users'
add_foreign_key :creations, :creation_statuses, column: 'creation_status_id', name: 'fk_creations_creation_statuses'

add_index :creations, 'sid', unique: true, name: 'idx_creations_sid'
add_index :creations, 'site_id', name: 'idx_creations_site_id'
add_index :creations, 'site_user_id', name: 'idx_creations_site_user_id'
add_index :creations, 'creation_status_id', name: 'idx_creations_creation_status_id'
add_index :creations, 'published_at', name: 'idx_creations_published_at'
