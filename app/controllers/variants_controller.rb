class VariantsController < ApplicationController

	def create
    @product = Product.find(params[:product_id])
    @variant = @product.variants.create(variant_params)
    redirect_to product_path(@product)
	end


	 def index
	 	# N+ sorununu çözmek için includes eklenir sadece bir kere çeker
		@variants = Variants.includes(:product).limit(20)
	end

  	def destroy
    @product = Product.find(params[:product_id])
    @variant = @product.variants.find(params[:id])
    @variant.stock = @variant.stock-1
    if @variant.stock < 0
		flash[:notice] = "No stock!"
	  redirect_to product_path(@product)
	else
		@variant.save
    redirect_to @product
    end
    
  	end
  	
	private
    def variant_params
      params.require(:variant).permit(:name, :stock)
    end
end
