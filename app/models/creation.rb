class Creation < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :site
  belongs_to :site_user
  belongs_to_active_hash :creation_status
  has_many :creation_pieces, -> { order id: :asc }
  has_many :creation_images, -> { order order: :asc }
  has_many :creation_tags, -> { order id: :asc }
  has_many :goods, -> { order id: :asc }
  has_many :comments, -> { order created_at: :asc }
end
