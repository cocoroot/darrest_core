class CreationTag < ActiveRecord::Base
  include LogicalDelete

  belongs_to :creation
  belongs_to :tag

  validates :tag, uniqueness: { message: 'on creation_id already exists.', scope: [:creation_id] }

  scope :for_users, -> { joins(:tag).merge(Tag.where(tag_class: TagClass::USERS)) }
end
