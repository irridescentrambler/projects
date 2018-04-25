require 'rails_helper'

RSpec.describe User, :type => :model do 
  describe "It tests the validity of Users" do
    before(:all) do
      @user = User.new(email: "example@abc.com", password: "abcdef", role: "admin")
    end

    it "Checks validity for email" do
      expect(@user.valid?).to be(true)
    end
  end

  describe "It checks availability of instance methods in User" do
    before(:all) do
      @user = User.new(email: "example@abc.com", password: "abcdef", role: "admin")
    end

    it "Checks user instance to respond to methos admin?" do
      expect(@user).to respond_to(:admin?)
    end
  end
end