class GraphController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:post,:show]
  protect_from_forgery with: :null_session
  @dato = ""
  def post
    @dato = Dato.new(datos_params)
    @dato.save
  end
  def show
    @dato=Dato.last
  end


  def datos_params
    params.require(:dato).permit(:presion,:tempeatura,:humedad,:carga,:clima)
  end
end
