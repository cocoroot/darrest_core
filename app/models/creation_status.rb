# coding: utf-8
class CreationStatus < ActiveHash::Base
  include ActiveHash::Enum

  self.data = [
    { id: 1, creation_status: 'Creating', name: '作成中' },
    { id: 2, creation_status: 'Published', name: '公開' },
    { id: 3, creation_status: 'Private', name: '非公開' },
    { id: 4, creation_status: 'UserDeleted', name: 'ユーザ削除' },
    { id: 5, creation_status: 'Inspected', name: '公開停止' }
  ]

  enum_accessor :creation_status
end
