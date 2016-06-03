class Tag < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :tag_class
  belongs_to :site

  validates :name, length: { maximum: 100 }
  validates :name, uniqueness: { message: 'in current site_id already exists.', scope: [:site_id] }
end
