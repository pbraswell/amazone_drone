class VisitorsController < ApplicationController

  def new
  	@products = Product.all
  end

end
