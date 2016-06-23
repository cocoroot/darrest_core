# coding: utf-8
errors = [
  {
    message_code: 'Not Found',
    message: '入力したURLと当サイトのリソースが一致しません。'
  }
]

json.errors do
  json.partial! partial: '/errors/error', collection: errors, as: :error  
end
