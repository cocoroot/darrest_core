create_table :site_users, id: :bigserial do |t|
  t.string :sid, limit: 32, null: false
  t.integer :user_id, null: false, limit: 8, default: 0
  t.string :biography, limit: 10000
  t.boolean :tos_accepted
  t.references :site_user_status, null: false, default: 0

  t.timestamps null: false
end

add_foreign_key :site_users, :users, column: 'user_id', name: 'fk_site_users_users'
add_foreign_key :site_users, :site_user_statuses, column: 'site_user_status_id', name: 'fk_site_users_site_user_statuses'

add_index :site_users, 'sid', unique: true, name: 'idx_site_users_sid'
add_index :site_users, 'user_id', name: 'idx_site_users_user_id'
add_index :site_users, 'site_user_status_id', name: 'idx_site_users_site_user_status_id'

execute("ALTER TABLE site_users ALTER COLUMN sid SET DEFAULT md5('site_users' || nextval('site_users_id_seq') || 'salt')")
