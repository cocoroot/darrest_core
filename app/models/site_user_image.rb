class SiteUserImage < ActiveRecord::Base
  belongs_to :site_user

  mount_uploader :image, SiteUserImageUploader

  validate :validate_content_type

  protected

  def validate_content_type
    unless %w(image/jpg image/jpeg image/gif image/png).include? image.file.content_type
      errors.add(:file, 'invalid content-type.')
    end
  end
end
