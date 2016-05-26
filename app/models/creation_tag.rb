class CreationTag < ActiveRecord::Base
  belongs_to :creation
  belongs_to :tag
  
  scope :for_users, -> { joins(:tag).merge(Tag.where(tag_class: TagClass::USERS)) }
end
