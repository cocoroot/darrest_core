# coding: utf-8
errors = [
  {
    message_code: 'Internal Server Error',
    message: 'ただいまメンテナンス中です。復旧までいましばらくお待ちください。'
  }
]

json.errors do
  json.partial! partial: '/errors/error', collection: errors, as: :error  
end
