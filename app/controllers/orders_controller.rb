class OrdersController < ApplicationController

	def new
	end

	def index
		@orders = Order.all
	end

	def create
	
		order = Order.new

		group = Group.where(name: params["groupname"], table_number: params["table"]).first
		
		if group == nil
			group = Group.new
			group.name = params["groupname"]
			group.table_number = params["table"]
			group.save
		end

		order.group_id = group.id

		order.save

		Product.all.each do |product|
			amount = Integer(params[product.name])

			if amount > 0
				orderproduct = OrderProduct.new
				orderproduct.amount = amount
				orderproduct.order_id = order.id
				orderproduct.product_id = Product.where(name: product.name).first.id
				orderproduct.save
			end

		end

		redirect_to orders_path	
	end 
end
