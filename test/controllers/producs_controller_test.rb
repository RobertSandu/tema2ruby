require 'test_helper'

class ProducsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create produc" do
    assert_difference('Product.count') do
      post :create, produc: { description: @product.description, image_url: @product.image_url, price: @product.price, quantity: @product.quantity, title: @product.title }
    end

    assert_redirected_to produc_path(assigns(:product))
  end

  test "should show produc" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update produc" do
    patch :update, id: @product, produc: { description: @product.description, image_url: @product.image_url, price: @product.price, quantity: @product.quantity, title: @product.title }
    assert_redirected_to produc_path(assigns(:product))
  end

  test "should destroy produc" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
