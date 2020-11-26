class PurchasesController < ApplicationController
  def index
    @purchase_form = PurchaseForm.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_params)
    @item = Item.find(params[:item_id])
      if @purchase_form.valid?
        @purchase_form.save
        redirect_to root_path
      else
        render :index
      end
  end

  private
 def purchase_params
  params.require(:purchase_form).permit(:user, :item, :postal_code, :shipping_area_id, :city, :home_number, :apartment_name, :phone_number)
 end

end
