class Creation < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions
  include SidGenerator

  belongs_to :site_user
  belongs_to_active_hash :creation_status
  has_many :creation_pieces
  has_many :creation_images

  before_create :generate_sid
end
