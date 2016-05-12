class Core::Category < ActiveRecord::Base
  belongs_to :parent, class_name: 'Core::Category'
end
