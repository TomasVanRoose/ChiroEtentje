class Order < ActiveRecord::Base
	has_many :order_products
	has_many :products, :through => :order_product
	has_many :orders
end
