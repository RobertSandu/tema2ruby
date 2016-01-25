class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy, :index]

  # GET /carts
  # GET /carts.json
  def index
    @cart = current_cart
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @cart = current_cart
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to current_cart, notice: 'Cosul de cumparaturi a fost sters cu succes' }
      format.json { head :no_content }
    end
  end

  private

    def set_cart
      @cart = Cart.find_by_id(params[:id])
    end

    def cart_params
      params[:cart]
    end
    
end
