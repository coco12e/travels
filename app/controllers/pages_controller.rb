class PagesController < ApplicationController
  def home
    @continents = Continent.all
    @hide_egypte_nav = true
  end
end
