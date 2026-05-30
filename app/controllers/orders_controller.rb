class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user == @item.user || @item.purchase.present?
      redirect_to root_path
    end
  end
end
