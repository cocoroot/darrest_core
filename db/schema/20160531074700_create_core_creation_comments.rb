create_table :creation_comments, id: :bigserial do |t|
  t.string :sid, limit: 32
  t.references :creation, null: false, limit: 8, default: 0
  t.references :site_user, null: false, limit: 8, default: 0
  t.string :body, limit: 1000
  t.integer :parent, limit: 8, null: true, default: nil
  t.string :notice_code, limit: 10

  t.timestamps null: false
end

add_foreign_key :creation_comments, :creations, column: 'creation_id', name: 'fk_creation_comments_creations'
add_foreign_key :creation_comments, :site_users, column: 'site_user_id', name: 'fk_creation_comments_site_user'
add_foreign_key :creation_comments, :creation_comments, column: 'parent', name: 'fk_creation_comments_parent'

add_index :creation_comments, 'sid', unique: true, name: 'idx_creation_comments_sid'
add_index :creation_comments, 'creation_id', name: 'idx_creation_comments_creation_id'
add_index :creation_comments, 'site_user_id', name: 'idx_creation_comments_site_user_id'
