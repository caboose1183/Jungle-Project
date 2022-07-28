class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.order(:id).all
  end

  def new
    @category = Category.new
  end

  def create
    # saves to category
    @category = Category.new(category_params)

    if @product.save
      redirect_to [:admin, :category], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
      :image
    )
  end
end
