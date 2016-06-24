# coding: utf-8
errors = [
  {
    message_code: 'Forbidden',
    message: 'アクセスは禁止されています。'
  }
]

json.errors do
  json.partial! partial: '/errors/error', collection: errors, as: :error  
end
