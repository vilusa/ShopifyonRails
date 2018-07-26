class ProductsController < ApplicationController
	# before_action actionlardan önce çalışacak fonksiyon 
 	before_action :find_product, only: [:show, :edit, :update, :destroy] 

	def new
		# errors collection hatasını önlemek için kullanılır
		@product = Product.new
	end

	def index
		@products = Product.all
	end

	def show
		
	end

	def create
	  @product = Product.new(product_params)
	 
	  if @product.save
	  	flash[:notice] = "New article successfuly saved."
	  redirect_to @product
	  else
	  	render 'new'
	  end

	end

	def destroy
		
		@product.destroy

		redirect_to products_path
	end


	private
	  # kayıt formundan gelen parametreleri almak için tanımlandı
	  def product_params
	    params.require(:product).permit(:name, :price, :description)
	  end

	  # tekrardan kaçınmak için find metodu
	  def find_product
	  	@product = Product.find(params[:id])
	  end
end
