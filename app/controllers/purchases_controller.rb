class PurchasesController < ApplicationController
  def new
    @purchase_form = PurchaseForm.new
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_params)
      if @purchase_form.valid?
        @purchase_form.save
        redirect_to action: :index
      else
        render action: :new
      end
  end

  private
 def purchase_params
  params.require(:purchase_form).permit(:user, :item, :postal_code, :shipping_area_id, :city, :home_number, :apartment_name, :phone_number)

end
