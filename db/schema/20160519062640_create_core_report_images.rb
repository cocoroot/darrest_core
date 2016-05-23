create_table :report_images, id: :bigserial do |t|
  t.references :report, null: false, default: 0, limit: 8
  t.string :image, limit: 2083
  t.integer :order

  t.timestamps null: false
end

add_foreign_key :report_images, :reports, column: 'report_id', name: 'fk_report_images_reports'

add_index :report_images, 'report_id', name: 'idx_report_images_report_id'
