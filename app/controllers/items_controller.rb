class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
     if @item.save
       redirect_to root_path(@item)
     else
       render :new
     end 
   end

   private
    def item_params
         params.require(:item).permit(:item_name, :introduction,:category_id,:condition_id,:charge_id,:delivery_time_id,:area_id,:price,:image).merge(user_id: current_user.id)
    end
 end
 

  #def destroy
  #end




  
