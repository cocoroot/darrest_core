class Core::CreationImage < ActiveRecord::Base
  belongs_to :creation

  mount_uploader :image, CreationImageUploader
end
