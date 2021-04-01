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
         params.require(:item).permit(:category_id,:condition_id,:charge_id,:delivery_time_id,:area_id,:price,:image)
    end
 end
 

  #def destroy
  #end




  
