FactoryGirl.define do
  factory :core_report_image, class: 'Core::ReportImage' do
    report nil
    sequence(:image) { |n| "test-image-%010d.jpg" % n }
  end
end
