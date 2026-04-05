class PagesController < ApplicationController
  def home
    @continents = Continent.all
  end
end
