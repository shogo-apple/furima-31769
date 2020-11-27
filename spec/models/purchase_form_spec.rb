require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_form = FactoryBot.build(:purchase_form)
    end
    context '購入がうまくいくとき' do
      it 'postal_code、shipping_area_id、city、home_number、phone_number、tokenが存在すれば購入できる。' do
        expect(@purchase_form).to be_valid
      end
    end
   context '購入がうまくいかない時' do
      it 'postal_codeが空だと保存できないこと' do
       @purchase_form.postal_code = nil
       @purchase_form.valid?
       expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'shipping_area_idが空だと保存できないこと' do
        @purchase_form.shipping_area_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Shipping area is not a number')
      end 
      it 'cityが空だと保存できないこと' do
        @purchase_form.city = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end
      it 'home_numberが空だと保存できないこと' do
        @purchase_form.home_number = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Home number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_form.phone_number = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_form.postal_code = '1234567'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code is invalid")
      end
      
       it 'phone_numberが11桁以下出ないと保存できないこと' do
         @purchase_form.phone_number = '123456789012'
         @purchase_form.valid?
         expect(@purchase_form.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
       end
      
      it "tokenが空では登録できないこと" do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
