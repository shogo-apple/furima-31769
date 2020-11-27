class PurchasesController < ApplicationController
  def index
    @purchase_form = PurchaseForm.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_params)
    @item = Item.find(params[:item_id])
      if @purchase_form.valid?
        Payjp.api_key = "sk_test_c1df4b46fe66697af649abdb"
        Payjp::Charge.create(
          amount: @item.price,
          card: purchase_params[:token],
          currency: 'jpy'
        )
        @purchase_form.save
        redirect_to root_path
      else
        render :index
      end
  end

  private
 def purchase_params
  params.require(:purchase_form).permit(:postal_code, :shipping_area_id, :city, :home_number, :apartment_name, :phone_number).merge( token: params[:token], user_id: current_user.id, item_id: params[:item_id])
 end

end
