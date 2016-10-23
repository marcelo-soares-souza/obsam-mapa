class HomeController < ApplicationController
  before_action :load_tipos_subtipos

  def index
    @dispositivos = Dispositivo.all
  end
end
