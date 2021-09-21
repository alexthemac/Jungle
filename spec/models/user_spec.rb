require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    context "Given correct information" do
      it "creates a user" do

        user = User.create(password: "test", password_confirmation: "test", name: "al", email: "al")
        expect(user).to be_valid

      end
    end
    context "Given password and password_confirmation fields that do not match" do
      it "does not create a user" do

        user = User.create(password: "test", password_confirmation: "nottest", name: "al", email: "al")
        expect(user).not_to be_valid

      end
    end
    context "Given no password and password_confirmation fields" do
      it "does not create a user" do

        user = User.create(name: "al", email: "al")
        expect(user).not_to be_valid

      end
    end
    context "Given no email" do
      it "does not create a user" do

        user = User.create(password: "test", password_confirmation: "test", name: "al", email: nil)
        expect(user).not_to be_valid

      end
    end
    context "Given no name" do
      it "does not create a user" do

        user = User.create(password: "test", password_confirmation: "test", name: nil, email: "al")
        expect(user).not_to be_valid

      end
    end
    context "Create user2 with matching email to user1 (exact same password cases)" do
      it "does not create a user2" do

        user1 = User.create(password: "test", password_confirmation: "test", name: "al", email: "al")
        user2 = User.create(password: "test2", password_confirmation: "test2", name: "al2", email: "al")
        expect(user1).to be_valid
        expect(user2).not_to be_valid

      end
    end
    context "Create user2 with matching email to user1 (same password, different cases)" do
      it "does not create a user2" do

        user1 = User.create(password: "test", password_confirmation: "test", name: "al", email: "al")
        user2 = User.create(password: "test2", password_confirmation: "test2", name: "al2", email: "AL")
        expect(user1).to be_valid
        expect(user2).not_to be_valid

      end
    end
    context "Given correct password length" do
      it "creates a user" do

        user = User.create(password: "test", password_confirmation: "test", name: "al", email: "al")
        expect(user).to be_valid

      end
    end
    context "Given incorrect password length" do
      it "does not creates a user" do

        user = User.create(password: "tes", password_confirmation: "tes", name: "al", email: "al")
        expect(user).not_to be_valid

      end
    end
  end
  # Testing authenticate_with_credentials function inside of app/models/user.rb
  describe '.authenticate_with_credentials' do
    context "Given correct login information" do
      it "should pass authentication" do

        user = User.create(password: "test2", password_confirmation: "test2", name: "al", email: "a2")
        response = User.authenticate_with_credentials("a2", "test2")   
        expect(response).to eq(user)

      end
    end
    context "Given incorrect login information (Does not match anything in db)" do
      it "should not pass authentication" do

        user = User.create(password: "test2", password_confirmation: "test2", name: "al", email: "a2")
        response = User.authenticate_with_credentials("asdasdasd", "asdasda")   
        expect(response).to be(nil)

      end
    end
    context "Given correct login email with extra spaces at end and start" do
      it "should pass authentication" do

        user = User.create(password: "test2", password_confirmation: "test2", name: "al", email: "example@domain.com")
        response = User.authenticate_with_credentials("   example@domain.com   ", "test2")   
        expect(response).to eq(user)
          
      end
    end
    context "Given correct login email but wrong case for the email" do
      it "should pass authentication" do
        
        user = User.create(password: "test2", password_confirmation: "test2", name: "al", email: "eXample@domain.COM")
        response = User.authenticate_with_credentials("EXAMPLe@DOMAIN.CoM", "test2")  
        expect(response).to eq(user)
          
      end
    end
  end
end
