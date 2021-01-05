require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

  describe 'ユーザーの商品一覧表機能'
    context '商品表示がうまくいく時' do
      it "nameとdetailとpriceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品表示がうまくいかない時' do
      it "nameが空だと登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "detailが空だと登録できない" do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end

      it "priceが空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "state_idが空だと登録できない" do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end

      it "burden_idが空だと登録できない" do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end

      it "category_idが空だと登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "origin_idが空だと登録できない" do
        @item.origin_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Origin can't be blank")
      end

      it "day_idが空だと登録できない" do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
    end
  end
end