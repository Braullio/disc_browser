class HomeController < ApplicationController
  def index; end

  def disc_history; end

  def disc_perfis
    @profile = %i[D I S C]
  end
end
