class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)

    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_address)
          .permit(
            :postal_code,
            :prefecture_id,
            :city,
            :address,
            :building,
            :phone_number,
            :token
          )
          .merge(
            user_id: current_user.id,
            item_id: @item.id
          )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']

    Payjp::Charge.create(amount: @item.price, card: purchase_params[:token], currency: 'jpy')
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    return unless current_user == @item.user || @item.purchase.present?

    redirect_to root_path
  end
end
