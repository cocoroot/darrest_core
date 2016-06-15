class SiteUserImage < ActiveRecord::Base
  belongs_to :site_user

  mount_uploader :image, SiteUserImageUploader

  validate :validate_content_type
  validates :image_name_for_user, length: { maximum: 256 }
  
  protected

  def validate_content_type
    content_type = image.file.content_type
    unless %w(image/jpg image/jpeg image/gif image/png).include? content_type
      errors.add(:file, 'invalid content-type.')
    end
  end
end
