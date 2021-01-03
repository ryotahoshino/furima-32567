require 'rails_helper'
describe Item do
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
    end
  end
end

