class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find,only: [:index]
  before_action :move_to_index,only: [:index]

  def index
    @purchase_history = PurchaseHistory.new
  end

  def create
    @purchase_history = PurchaseHistory.new(purchase_history_params)
    @item = Item.find(params[:item_id])
    if @purchase_history.valid?
      purchase_card
      @purchase_history.save
      return redirect_to root_path 
    else
      render :index
    end
  end

  private

  def purchase_history_params
    params.require(:purchase_history).permit(:post_code, :area_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id,token: params[:token],item_id: params[:item_id])
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id 
    redirect_to root_path
   end
  end


  def purchase_card
   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
   Payjp::Charge.create(
    amount: @item[:price],  
    card: purchase_history_params[:token],
    currency: 'jpy'
   )
  end
end