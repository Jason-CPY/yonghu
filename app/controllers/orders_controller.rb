class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = current_user.orders.paginate(page: params[:page], per_page: 10).order(updated_at: :desc)
  end

  def show
  end

  def new
    @order = Order.new(category_id: params[:category])
  end

  def create
    @order = current_user.orders.create(order_params.merge(city: current_city))

    respond_to do |format|
      if @order.save
        @order.next!
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:category_id, :user_address_id)
  end
end