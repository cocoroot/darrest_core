class SiteUser < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :site_user_status
  belongs_to :user
  has_many :site_user_images
  has_many :goods
  has_many :reports
  has_many :site_user_tags
end
