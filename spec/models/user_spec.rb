

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kanaが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが6文字以上であれば登録できること" do
      @user.password = "123abc"
      @user.password_confirmation = "123abc"
      expect(@user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "123ab"
      @user.password_confirmation = "123ab"
      expect(@user.errors.full_messages).to include("Password is too short (minimun is 6 characters)")
    end

    it "passwordとpassword_confirmationが一致していないと登録できない" do
      @user.password = "123abc"
      @user.password_confirmation = "123abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "password:半角英数混合" do
      @user.password = "123abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password includes both letters and numbers")
    end

    it "last_nameが空では登録できないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last_name can't be blank")
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name can't be blank")
    end

    it "last_name_kanaが空では登録できないこと" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last_name_kana can't be blank")
    end

    it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name_kana can't be blank")
    end
  end
end