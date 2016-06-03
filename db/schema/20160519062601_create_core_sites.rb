create_table :sites do |t|
  t.string :name, limit: 100
  t.string :url, limit: 256
  t.string :access_key, limit: 36

  t.timestamps null: false
end

add_index :sites, 'access_key', unique: true, name: 'idx_sites_access_key'
