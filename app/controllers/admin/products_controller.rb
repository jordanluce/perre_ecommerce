class Admin::ProductsController < Admin::BaseController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(strong_params)
    if @product.save
      redirect_to admin_products_path, notice: 'successfully created product'
    else
      flash[:alert] = 'There was a problem saving the product'
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(strong_params)
      redirect_to admin_products_path, notice: "successfully updated product"
    else
      flash[:alert] = 'There was a problem updating the product'
      render 'edit'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end

  private

  def strong_params
    params.require(:product).permit(:name, :price, :description, :image)
  end
end