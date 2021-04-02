class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]
  before_action :authenticate_user!, except: [:index,:show]

  def index
    @items = Item.order(created_at:"desc")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
     if @item.save
       redirect_to root_path
     else
       render :new
     end 
   end

   def show
    @item = Item.find(params[:id])
   end

   def edit
   end
   
   def destroy
    item = Item.find(params[:id])
    if item.destroy
      render root_path
    end 
   end


   private
    def item_params
         params.require(:item).permit(:item_name, :introduction,:category_id,:condition_id,:charge_id,:delivery_time_id,:area_id,:price,:image).merge(user_id: current_user.id)
    end
 end
 





  
