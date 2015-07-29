FactoryGirl.define do
  factory :signature do
    name "John Smith"
    sequence(:email) {|n| "John_Smith#{n}@b"}
    zip "90210"
  end
end
