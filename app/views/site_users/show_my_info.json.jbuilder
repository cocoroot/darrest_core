json.site_user do
  json.partial! partial: 'site_user', locals: { site_user: @result[:site_user] }

  json.owner @result[:owner] if @result.key?(:owner)
end
