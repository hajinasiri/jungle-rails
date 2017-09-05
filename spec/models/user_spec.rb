require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @myuser = User.create first_name: 'hosein', last_name: 'askari', email: 'h@a', password: "shampoo", password_confirmation: "shampoo"
    @wronguser= User.create first_name: 'hosein', last_name: 'askari', email: 'h@b', password: "shampoo", password_confirmation: "agha"
    @worngemail = User.create first_name: 'ruby', last_name: 'rails', email: 'h@a', password: "shampoo", password_confirmation: "shampoo"
    @wrongfirstname =User.create last_name: 'rails', email: 'h@c', password: "shampoo", password_confirmation: "shampoo"
    @wronglastname =User.create first_name: 'rails', email: 'h@d', password: "shampoo", password_confirmation: "shampoo"
    @emptyemail =User.create first_name: 'rails',last_name: "last", password: "shampoo", password_confirmation: "shampoo"
    @shortpassword = User.create first_name: 'hos', last_name: 'ask', email: 'h@e', password: "sh", password_confirmation: "sha"

  end
  describe 'Validations' do

    it 'should create user if password_confirmation is corret' do
      expect(@myuser.id).to be_present
    end

    it 'should not create user if password_confirmation is not corret' do
      expect(@wronguser.id).to be_nil
    end

    it "should not create user if email is not uique" do
      expect(@worngemail.id).to be_nil
    end

    it "should not create user if first_name is empty" do
      expect(@wrongfirstname.id).to be_nil
    end

    it "should not create user if last_name is empty" do
      expect(@wronglastname.id).to be_nil
    end

    it "should not create user if email is empty" do
      expect(@emptyemail.id).to be_nil
    end

    it "should not create user if password length is less than 4" do
      expect(@shortpassword.id).to be_nil
    end
  end

  describe '.authenticate_with_credentials' do
    it "fail with empty password" do
      expect(User.authenticate_with_credentials("h@a","")).to be_nil
    end

    it " should pass with the right passowrd" do
      expect(User.authenticate_with_credentials("h@a","shampoo")).to eq(@myuser)
    end

    it "should remove spaces from email" do
      expect(User.authenticate_with_credentials("h@ a","shampoo")).to eq(@myuser)
    end

    it "shouldn't be case sensitive for email" do
      expect(User.authenticate_with_credentials("h@A","shampoo")).to eq(@myuser)
    end

    it "should fail with wrong password" do
      expect(User.authenticate_with_credentials("h@a","sdfdf")).to be_nil
    end

  end

  after(:each) do
        @myuser.destroy
    end
end




