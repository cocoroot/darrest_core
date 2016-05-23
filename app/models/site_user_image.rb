class SiteUserImage < ActiveRecord::Base
  belongs_to :site_user

  mount_uploader :image, SiteUserImageUploader

  validate :validaet_content_type

  protected

  def validet_content_type
    unless %w(image/jpg image/jpeg image/gif image/png).include? file.file.content_type
      errors.add(:file, 'invalid content-type.')
    end
  end
end
