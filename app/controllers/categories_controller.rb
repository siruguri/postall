class CategoriesController < ApplicationController
  def new
    @categories=Category.all
    sa
  end
end
