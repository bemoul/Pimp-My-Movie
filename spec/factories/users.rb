FactoryBot.define do
  factory :user do
    
  email { Faker::Name.first_name+"@THISPART.com" }
  password { "gggggggggg" }
   password_confirmation { "gggggggggg" }
end
  end

