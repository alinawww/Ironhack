class ProductController < ApplicationController
  def index
    @products = Product.all
    render 'index'
  end
  def show
    # @my_user = User.find(params[:user_id])
    # @my_products = @my_user.products.all
    # render 'show'
  end

  def create
    # byebug
    @my_user = User.find(params[:user_id])
    @my_product = @my_user.products.create(
      title: params[:product][:title],
      description: params[:product][:description],
      bid_dl: params[:product][:bid_dl]
    )
    @my_product.save
    redirect_to '/products'
  end
  def new
    @my_user = User.find(params[:user_id])
    @my_product = Product.new
    render 'new'
  end
  def destroy

  end
end
