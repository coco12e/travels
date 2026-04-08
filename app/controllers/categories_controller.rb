class CategoriesController < ApplicationController
  before_action { @show_categories_nav = true }

  def index
    @trip = Trip.find(params[:trip_id])
    @categories = Category.all.order(:id)
  end
end
