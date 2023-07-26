class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  protect_from_forgery with: :exception, unless: -> {request.format.json?}


  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    puts "Received order params: #{order_params.inspect}"
  
    respond_to do |format|
      if @order.save
        # Save the order first to assign an ID
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
  
        # Check if order items are present and not empty before creating them
        if params[:order_items].present? && params[:order_items].any?
          create_order_items_for_order(@order)
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def create_order_items_for_order(order)
    puts "Creating order items..."
    params[:order_items].each do |item_params|
      puts "Item params: #{item_params.inspect}"
  
      order_item = OrderItem.create(
        order_id: order.id,
        title: item_params[:title],
        description: item_params[:description],
        price: item_params[:price],
        quantity: item_params[:quantity]
      )
    end
  end 

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:title, :description, :price, :quantity, :email_address, id: [])
    end
    
    def get_order_with_items
      order_id = params[:id]
      order = Order.find(order_id)
      order_items = order.order_items
    
      render json: { order: order, order_items: order_items }
    end
end
