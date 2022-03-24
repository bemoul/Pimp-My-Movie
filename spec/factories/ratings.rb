FactoryBot.define do
  factory :rating do
        # belongs to user
        user { FactoryBot.create(:user) }
  end
end
