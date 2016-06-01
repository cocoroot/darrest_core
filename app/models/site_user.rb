class SiteUser < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :site
  belongs_to :user
  belongs_to_active_hash :site_user_status
  has_many :site_user_images
  has_one :site_user_header_image, -> { order id: :desc }
  has_many :goods
  has_many :reports
  has_many :site_user_tags

  validates :biography, length: { maximum: 10000 }

  #scope :using_site_user_image, -> { joins(:site_user_images).where(SiteUserImage.in_use) }
  def using_site_user_image
    site_user_images.in_use.first
  end
end
