FactoryGirl.define do
  factory :report_image do
    report nil
    sequence(:image) { |n| "test-image-%010d.jpg" % n }
  end
end
