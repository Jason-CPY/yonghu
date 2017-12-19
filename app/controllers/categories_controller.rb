class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  # GET /categories
  # GET /categories.json
  def index
    @categories = current_city.categories.where(is_del: 0)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @price_rule = @category.get_price_rule(current_city)
    @products = @category.products.where(is_del: 0).paginate(page: params[:page], per_page: 10).order(updated_at: :desc)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

end