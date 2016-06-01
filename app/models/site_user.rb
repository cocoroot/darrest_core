class SiteUser < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :site
  belongs_to :user
  belongs_to_active_hash :site_user_status
  has_one :site_user_images, -> { order id: :desc }
  has_one :site_user_header_image, -> { order id: :desc }
  has_many :goods
  has_many :reports
  has_many :site_user_tags

  validates :biography, length: { maximum: 10_000 }

  def using_site_user_image
    site_user_images.in_use.first
  end
end
