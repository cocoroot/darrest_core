FactoryGirl.define do
  factory :report_image do
    report
    sequence(:image) { |n| "image#{format('%03d', n)}.jpg" }
    sequence(:order) { |n| n }
  end
end
