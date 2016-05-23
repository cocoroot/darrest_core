# coding: utf-8
class TagClass < ActiveHash::Base
  include ActiveHash::Enum

  self.data = [
    { id: 1, tag_class: 'Users', name: '会員登録タグ' },
    { id: 2, tag_class: 'Managers', name: '管理登録タグ' }
  ]

  enum_accessor :tag_class
end
