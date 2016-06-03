# coding: utf-8
class SiteUserImageUploader < UploaderBase
  include CarrierWave::RMagick
  process convert: 'jpg'

  # "site-user-images/#{mounted_as}/#{model.id}"
  def store_dir
    "site_users/#{model.site_user_id}/site_user_images/"
  end

  version :thumb do
    process resize_to_fit: [100, 100]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    # rake から呼び出される事も考慮して present? は使用しない
    if !original_filename.nil? && !original_filename.empty?
      file_name_hash = secure_token
      model.image_name_for_user = original_filename
      "#{file_name_hash}.jpg"
    end
  end
end
