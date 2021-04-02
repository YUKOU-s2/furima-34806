class ItemsController < ApplicationController
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
       move_to_index 
       @item.destroy
       redirect_to root_path
   end


   private
    def item_params
         params.require(:item).permit(:item_name, :introduction,:category_id,:condition_id,:charge_id,:delivery_time_id,:area_id,:price,:image).merge(user_id: current_user.id)
    end

    def move_to_index
      @item = Item.find(params[:id])
      unless user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
     end
    end
 end
 





  
