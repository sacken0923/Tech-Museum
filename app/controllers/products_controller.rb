class ProductsController < ApplicationController
  def index
    @products = Product.all.order(id: "DESC")
    @lankings = Product.all.limit(3).order(id: "DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
    redirect_to root_path
    else
    render "new"
    end
  end

  def show
    @product = Product.find(params[:id])
    @user = User.find(@product.user_id)
  end

  def search
    @products = Product.where('title LIKE(?)', "%#{params[:keyword]}%").limit(20)
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :image, :product_url, :language, :term).merge(user_id: current_user.id)
  end
  # def move_to_index
  #   redirect_to action: :index unless user_signed_in?
  # end
end
