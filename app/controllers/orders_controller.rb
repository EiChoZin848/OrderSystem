class OrdersController < ApplicationController
  before_filter :authenticate
  #before_action :authenticate_user!

  def index
    @orders = Order.all
    @title = "All Orders"

  end

  def new
    @order = Order.new
    @title = "Add Order"
    
  end

  def create
    @order = Order.new(params[:order])

    if @order.save
      redirect_to orders_path, :notice=> 'Order was successfully created.'
    else
      redirect_to new_order_path, :alert=> 'Error! Please try again'
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

    if @order.update_attributes(params[:order])
      redirect_to orders_path, :notice=> 'Order was successfully updated.'
    else
      redirect_to new_order_path, :alert=> 'Error! Please try again'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.destroy
      redirect_to orders_path, :notice => 'Order was successfully deleted.'
    else
      redirect_to orders_path, :alert => 'Error! Please try again'
    end
  end

  private 
    def authenticate
      deny_access unless signed_in?
    end

    
end
