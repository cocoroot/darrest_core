if creation
  json.goods_count creation.goods.count
  json.good creation.goods.exists?(site_user_id: requester_site_user_id)
end
