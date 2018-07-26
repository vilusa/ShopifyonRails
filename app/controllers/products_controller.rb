class ProductsController < ApplicationController

	def new
		@product = Product.new
	end

	def create
	  @product = Product.new(product_params)
	 
	  if @pruduct.save
	  	flash[:notice] = "New article successfuly saved."
	  redirect_to @product
	  else
	  	render 'new'
	  end

	end
end
