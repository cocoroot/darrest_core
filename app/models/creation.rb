class Creation < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :site
  belongs_to :site_user
  belongs_to_active_hash :creation_status
  has_many :creation_pieces
  has_many :creation_images
end
