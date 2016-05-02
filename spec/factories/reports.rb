# coding: utf-8
FactoryGirl.define do
  factory :report do
    creation nil
    user nil
    sequence(:title) { |n| "test report title %05d" % n }
    sequence(:detail) { |n| "test report %05d\nテストレポート\ntest" % n }
  end
end
