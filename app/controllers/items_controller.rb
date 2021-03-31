class ItemsController < ApplicationController

  #def index
  #  @items = User.all
  #end

  #def new
  #  @item = User.new
  #end

  #def destroy
  #end

  private
  
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
