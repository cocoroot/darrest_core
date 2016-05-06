class Core::CreatorImage < ActiveRecord::Base
  belongs_to :creator

  mount_uploader :image, CreatorImageUploader
end
