class User < ActiveRecord::Base
  belongs_to :user

  validates :baas_id, presence: true, uniqueness: true
end
