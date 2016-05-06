class Core::UserImage < ActiveRecord::Base
  belongs_to :user

  mount_uploader :image, UserImageUploader
end
