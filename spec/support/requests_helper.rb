
module RequestsHelper
  def get_by_site(path, site_id, params={}, headers={})
    access_key = Site.find(site_id).try(:access_key)
    headers.merge!('HTTP_ACCESS_KEY' => access_key)
    get path, params, headers
  end

  def post_by_site(path, site_id, params={}, headers={})
    access_key = Site.find(site_id).try(:access_key)
    headers.merge!('HTTP_ACCESS_KEY' => access_key)
    post path, params, headers
  end

  def put_by_site(path, site_id, params={}, headers={})
    access_key = Site.find(site_id).try(:access_key)
    headers.merge!('HTTP_ACCESS_KEY' => access_key)
    put path, params, headers
  end

  def delete_by_site(path, site_id, params={}, headers={})
    access_key = Site.find(site_id).try(:access_key)
    headers.merge!('HTTP_ACCESS_KEY' => access_key)
    delete path, params, headers
  end
end
