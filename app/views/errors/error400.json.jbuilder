# coding: utf-8
errors = [
  {
    message_code: 'Bad Request',
    message: '要求の形式が正しくありません。'
  }
]

json.errors do
  json.partial! partial: '/errors/error', collection: errors, as: :error  
end
