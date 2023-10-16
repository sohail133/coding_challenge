class OrdersController < ApplicationController
	before_action :get_order, only: [:update]

	def index
		@orders = Order.in_progress.includes(:items)
	end

	def update
		if @order.update(status: Order.statuses['completed'])
			flash[:notice] = 'status has been updated'
		else
			flash[:alert] = 'Error while updating status'
		end
		redirect_to root_path
	end

	private

	def get_order
		@order = Order.find_by(id: params[:id])
	end
end
