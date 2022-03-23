# bundle exec rspec spec/models/user_spec.rb

require 'rails_helper'

 RSpec.describe User, type: :model do

   before(:each) do 
  # en général, tu as envie de créer une nouvelle instance
#   t.string "email"
#   t.string "encrypted_password",
# @mail = Faker::Name.first_name+"@THISPART.com"
  #  @user = User.create(email: @mail, password: "gggggggggg", password_confirmation: "gggggggggg")
  @user = create(:user)
  
end



  context "validations" do

    it "is valid with valid attributes" do
      # création qui est valide
      expect(@user).to be_a(User)
      expect(@user).to be_valid

    end
  end
    describe "#some_attribute" do
        it "should not be valid with bad email" do
      # teste cet attribut, en fonction de la validation que tu lui as donnée
      bad_user = User.create(email: "Doe", password: "gggggggggg", password_confirmation: "gggggggggg")
      expect(bad_user).not_to be_valid
      expect(bad_user.errors.include?(:email)).to eq(true)
        end
    end


    describe "#some_attribute" do
        it "should not be valid without password" do
        # teste cet attribut, en fonction de la validation que tu lui as donnée
        bad_user = User.create(email: "Doe")
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:password)).to eq(true)
        end
  end

  context "associations" do

    # describe "books" do
    #     it "should have_many books" do
    #       book = Book.create(user: @user)
    #       expect(@user.books.include?(book)).to eq(true)
    #     end
    #   end


    describe "comment" do
      # teste cette association
      it "should have_many comments" do
        comment = Comment.create(user: @user)
        expect(@user.comments.include?(comment)).to eq(true)
    end

  end








#   context "callbacks" do

#     describe "some callbacks" do
#       # teste ce callback
#     end

#   end

#   context "public instance methods" do

#     describe "#some_method" do
#       # teste cette méthode
#     end

#   end

#   context "public class methods" do

#     describe "self.some_method" do
#       # teste cette méthode
#     end

  end

end