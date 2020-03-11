require 'rails_helper'

RSpec.describe User, type: :model do

    describe 'アカウント作成テスト' do

      it "名前、emailアドレス、パスワードがあれば登録できる" do
        user = build(:user)
        expect(user).to be_valid
      end
  
      it "名前が空欄だと登録できない" do
        user = build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end
  
      it "emailアドレスが空欄だと登録できない" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end
  
      it "パスワードが空欄だと登録できない" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

    end
end