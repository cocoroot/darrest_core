class CreationComment < ActiveRecord::Base
  belongs_to :creation
  belongs_to :site_user

  validates :body, length: { maximum: 1000 }
end
