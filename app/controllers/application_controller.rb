class ApplicationController < ActionController::Base
  before_filter :autorizare_utilizator

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :utilizatorul_este_admin_boolean
  helper_method :utilizatorul_este_logat

  def utilizatorul_este_admin_boolean
    utilizator = User.find_by_id(session[:user_id])
    utilizator.role == "administrator"
  end

  def utilizatorul_este_logat
    utilizator = User.find_by_id(session[:user_id])
    utilizator.present?
  end

  protected

  def autorizare_utilizator
    
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, :notice => "Trebuie sa te loghezi inainte de a folosi magazinul"
    end

  end

  

  private

  def current_user

    User.find_by_id(session[:user_id])

  end

  def current_cart

  	Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
  	cart = Cart.create
  	session[:cart_id] = cart.id
  	cart
    
  end

  
end
