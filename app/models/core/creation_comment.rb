class Core::CreationComment < ActiveRecord::Base
  belongs_to :creation
  belongs_to :user
  belongs_to :parent, class_name: 'Core::CreationComment'
end
