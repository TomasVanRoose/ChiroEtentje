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

	def index
		respond_to do |format|
			format.html
			format.json {
				@groups = Group.all

				@json_groups = []
				for @group in @groups
					@json_groups.append({
						id: @group.id,
						table_number: @group.table_number,
						name: @group.name
					})
				end
				render json: @json_groups
			}
		end
	end
end
