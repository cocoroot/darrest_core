class Tag < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :tag_class
  belongs_to :site
end
