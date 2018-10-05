class Admin::SizesController < Admin::BaseController
  def index
    @size = Size.new
    @sizes = Size.all
  end

  def create
    @size = Size.new(strong_params)
    if @size.save
      redirect_to admin_sizes_path, notice: 'Size successfully created'
    else
      flash[:alert] = 'There was a problem saving your size'
      render 'index'
    end
  end

  def edit
    @size = Size.find(params[:id])
  end

  def update
    @size = Size.find(params[:id])
    if @size.update(strong_params)
      redirect_to admin_sizes_path, notice: 'Size successfully updated'
    else
      flash[:alert] = 'There was a problem update your size'
    end
  end

  def destroy
    @size = Size.find(params[:id])
    @size.destroy
    redirect_to admin_sizes_path
  end

  private

  def strong_params
    params.require(:size).permit(:name)
  end
end