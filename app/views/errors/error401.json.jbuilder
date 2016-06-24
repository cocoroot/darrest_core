# coding: utf-8
errors = [
  {
    message_code: 'Unauthorized',
    message: 'アクセスは認証されていません。'
  }
]

json.errors do
  json.partial! partial: '/errors/error', collection: errors, as: :error  
end
