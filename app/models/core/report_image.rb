class Core::ReportImage < ActiveRecord::Base
  belongs_to :report

  mount_uploader :image, ReportImageUploader
end
