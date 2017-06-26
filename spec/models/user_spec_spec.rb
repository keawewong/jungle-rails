require 'rails_helper'


RSpec.describe User, type: :model do

  describe "password validation" do
    it "creates user" do
      @user = User.new(first_name: "matt", last_name: "socha", email: "matt@memail.com", password: "pass", password_confirmation: "pass")
      expect(@user).to_not be_nil
    end


    it "password matches password_confirmation " do
      @user = User.new(first_name: "matt", last_name: "socha", email: "matt@memail.com", password: "pass", password_confirmation: "pass")
      expect(@user.password).to eql(@user.password_confirmation)
    end

    it "password does not match password_confirmation " do
      @user = User.new(first_name: "matt", last_name: "socha", email: "matt@memail.com", password: "pass", password_confirmation: "stuff")
      expect(@user.password).to_not eql(@user.password_confirmation)
    end

    it "password and password_confirmation values exist" do
      @user = User.new(first_name: "matt", last_name: "socha", email: "matt@memail.com", password: "pass", password_confirmation: "stuff")
      expect(@user.password).to_not be_nil
      expect(@user.password_confirmation).to_not be_nil
    end


    it "password is long enough" do
      @user = User.new(first_name: "matt", last_name: "socha", email: "matt@memail.com", password: "12345", password_confirmation: "12345")
      expect(@user.password.length).to be >= 5
    end
  end

  describe '.authenticate_with_credentials' do

    it "create user" do
      user = User.create(first_name: "bob", last_name: "long", email: "bob@email.com", password: "1234", password_confirmation: "1234")
      authorized_user = User.authenticate_with_credentials(user.email, user.password)
      expect(authorized_user).to_not be_nil
    end

  end

end
