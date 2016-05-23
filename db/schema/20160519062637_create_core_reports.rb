create_table :reports, id: :bigserial do |t|
  t.references :creation, null: false, limit: 8, default: 0
  t.references :site_user, null: false, limit: 8, default: 0
  t.string :title, limit: 200, null: false
  t.string :detail, limit: 10000

  t.timestamps null: false
end

add_foreign_key :reports, :creations, column: 'creation_id', name: 'fk_reports_creations'
add_foreign_key :reports, :site_users, column: 'site_user_id', name: 'fk_reports_site_users'

add_index :reports, 'creation_id', name: 'idx_reports_creation_id'
add_index :reports, 'site_user_id', name: 'idx_reports_site_user_id'
