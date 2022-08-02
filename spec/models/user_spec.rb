require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'is valid when validations all pass' do
      @user = User.create first_name: "Test", last_name: 'ing', email: "Test@gmail.com", password: '123456789', password_confirmation: '123456789'
      expect(@user).to be_valid
    end

    it 'is not valid when passwords are diffferent' do
      @user = User.create first_name: "Test", last_name: 'ing', email: "Test@gmail.com", password: '123', password_confirmation: '1234'
      expect(@user).to_not be_valid
    end

    it 'is not valid when passwords not filled in' do
      @user = User.create first_name: "Test", last_name: 'ing', email: "Test@gmail.com", password: nil, password_confirmation: '1234'
      expect(@user).to_not be_valid
    end

    it 'is not valid when email exists' do
      @user = User.create first_name: "Test", last_name: 'ing', email: "Test@gmail.com", password: '123', password_confirmation: '123'
      @user2 = User.create first_name: "Test", last_name: 'ing', email: "Test@gmail.com", password: '123', password_confirmation: '123'

      expect(@user2).to_not be_valid
    end

    it 'is not valid when email exists, for case sensitive scenario' do
      @user = User.create first_name: "Test", last_name: 'ing', email: "Test@gmail.com", password: '123', password_confirmation: '123'
      @user2 = User.create first_name: "Test", last_name: 'ing', email: "test@gmail.com", password: '123', password_confirmation: '123'
      
      expect(@user2).to_not be_valid
    end

    it 'is not valid when first name is empty' do
      @user = User.create first_name: nil, last_name: 'ing', email: "Test@gmail.com", password: '123', password_confirmation: '123'
      
      expect(@user).to_not be_valid
    end

    it 'is not valid when last name is empty' do
      @user = User.create first_name: 'Test', last_name: nil, email: "Test@gmail.com", password: '123', password_confirmation: '123'
      
      expect(@user).to_not be_valid
    end

    it 'is not valid when email is empty' do
      @user = User.create first_name: "Test", last_name: 'ing', email: nil, password: '123', password_confirmation: '123'
      
      expect(@user).to_not be_valid
    end

    it 'is not valid when password is less than 8 characters' do
      @user = User.create first_name: "Test", last_name: 'ing', email: nil, password: '123', password_confirmation: '123'
      
      expect(@user).to_not be_valid
    end

    it 'is valid when password has minimum 8 characters' do
      @user = User.create first_name: "Test", last_name: 'ing', email: nil, password: '12345678', password_confirmation: '12345678'
      
      expect(@user).to_not be_valid
    end
  end


  describe '.authenticate_with_credentials' do

    before (:each) do
      @user = User.create first_name: "Test", last_name: 'ing', email: "first@gmail.com", password: '12345678', password_confirmation: '12345678'
    end

    it 'should not be nil if user exists' do
      @login = User.authenticate_with_credentials('first@gmail.com', '12345678')
      
      expect(@login).to_not be_nil
    end

    it 'should be nil if user does not exist' do
      @login = User.authenticate_with_credentials('second@gmail.com', '12345678')
      
      expect(@login).to be_nil
    end

    it 'should not be nil if user exists even with white space' do
      @login = User.authenticate_with_credentials('first@gmail.com      ', '12345678')
      
      expect(@login).to_not be_nil
    end

    it 'should not be nil if user exists and entered different cases' do
      @login = User.authenticate_with_credentials('First@gmail.com      ', '12345678')
      
      expect(@login).to_not be_nil
    end



  end

end
