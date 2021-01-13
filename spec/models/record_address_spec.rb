require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  describe '#create' do
    before do
      @record_address = FactoryBot.build(:record_address)
    end

  describe 'ユーザーの商品購入機能'
    context '商品購入がうまくいく時' do
      it "建物以外の全ての値が正しく入力されている時" do
        expect(@record_address).to be_valid
      end
      it "buildingが空でも保存できる" do
        @record_address.building = nil
        expect(@record_address).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it "zip_codeが空だと購入できない" do
        @record_address.zip_code = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Zip code can't be blank")
      end
      it "zip_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと" do
        @redord_address.zip_code = "8528043"
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end
      it "urban_idが空だと購入できない" do
        @record_address.urban_id = nil
        @record_address.valid?
        expect(@record_address.errprs.full_messages).to include("Urban_id can't be blank")
      end
      it "cityが空だと購入できない" do
        @record_address.city = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空だと購入できない" do
        @record_address.address = nil
        @record_address.address.valid?
        expect(@record_address.errors.full_messages).to include("Address can't be blank")
      end
      it "telephone_numberが空だと購入できない" do
        @record_address.telephone_number = nil
        @recore_address.telephone_number.valid?
        expect(@record_address.errors.full_messages).to include("Telephone_number can't be blank")
      end
    end
  end
end