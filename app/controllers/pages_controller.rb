class PagesController < ApplicationController
  before_action :hide_egypte

  def home
    @continents = Continent.all
  end

  private

  def hide_egypte
    @hide_egypte_nav = true
  end
end
