FactoryGirl.define do
  factory :user do
    sequence(:email, ActiveRecord::Base.connection.table_exists?('users') ? User.next_id : 0) {|n| "person_#{n}@example.com" }
    password "password"
  end

  factory :admin_user, :parent => :user do
    after(:build) do |user|
      user.email = "admin@eff.org"
      user.admin = true
    end
  end

end
