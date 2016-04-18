class GroupsController < ApplicationController
	def show
		@group = Group.find(params[:id])

		# A hashmap with keys productnames and values the amount
		products = {}

		orders = Order.where(group_id:	@group.id)

	    orders.each do |order|
			
			order_products = OrderProduct.where(order_id: order.id)

			order_products.each do |order_product|

				product = Product.where(id: order_product.product_id).first 

				if !products[product.name]
					products[product.name] = order_product.amount
				else
					products[product.name] += order_product.amount
				end

			end	
		end

		@products = products

	end
end
