create_table :users, id: :bigserial do |t|
  t.string :baas_id, null: false

  t.timestamps null: false
end

add_index :users, :baas_id, unique: true, name: 'idx_users_baas_id'
