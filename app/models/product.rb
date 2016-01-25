class Product < ActiveRecord::Base

	has_many :line_items
	before_destroy :nu_sterge_daca_e_in_cart

	validates :title, :description, :image_url, :price, :quantity, :presence => true
	validates :price, :numericality => {:greater_than_or_equal_to => 0.01, :message => "Pretul produsului trebuie sa fie mai mare sau egal cu 0.1"}
	validates :quantity, :numericality => {:greater_than_or_equal_to => 1, :message => "Cantitatea disponibila initial trebuie sa fie mai mare sau egala cu 1"}
	validates :title, :uniqueness => {:message => "Produsul exista deja in magazin. Cresteti stocul produsului existent sau redunimiti produsul curent."}
	#validates :image_url, format: {
    # with: %r{\.(gif|jpg|png)$}i,
    #  message: 'Imaaginea trebuie sa fie de tip gif, jpg sau png'
  	#}

  	def nu_sterge_daca_e_in_cart
  		if line_items.count.zero?
  			return true
  		else
  			return false
  		end
  	end

end
