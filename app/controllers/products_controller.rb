class ProductsController < ApplicationController
  before_action :set_produc, only: [:show, :edit, :update, :destroy]

  before_action :utilizatorul_este_admin

  # GET /products
  # GET /products.json
  def index
    @products = Product.where(Product.arel_table[:quantity].gt(0)).all#find(:all, :conditions => ['quantity > ?', 0])
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(produc_params)

      if @product.save
        redirect_to store_url
      end
    
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(produc_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to producs_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

    def utilizatorul_este_admin
      utilizator = User.find_by_id(session[:user_id])
      unless utilizator.role == "administrator"
        redirect_to store_url
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produc
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produc_params
      params.require(:product).permit(:title, :description, :image_url, :price, :quantity)
    end
end
