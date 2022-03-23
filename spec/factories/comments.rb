FactoryBot.define do
  factory :comment do
    # belongs to user
    comment  { description:  'Lorem ipsum ...' }
    user { FactoryBot.create(:user) }
  end

  it "should belongs_to user" do
    user { FactoryBot.create(:user) }
    comment = FactoryBot.create(:comment, user: user)
    expect(user.comment.include?(comment)).to eq(true)
  end
end


# factory d'un Book, qui belongs_to user.
# FactoryBot.define do
#   factory :book do
#     user { FactoryBot.create(:user) }  
#   end
# end