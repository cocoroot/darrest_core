create_table :goods, id: :bigserial do |t|
  t.references :creation, null: false, limit: 8, default: 0
  t.references :site_user, null: false, limit: 8, default: 0

  t.timestamps null: false
  t.datetime :removed_at
  t.integer :removed_id, limit: 8, default: 0
end

add_foreign_key :goods, :creations, column: 'creation_id', name: 'fk_goods_creations'
add_foreign_key :goods, :site_users, column: 'site_user_id', name: 'fk_goods_site_users'

add_index :goods, 'creation_id', name: 'idx_goods_creation_id'
add_index :goods, 'site_user_id', name: 'idx_goods_site_user_id'
add_index :goods, 'removed_id', name: 'idx_goods_removed_id'
