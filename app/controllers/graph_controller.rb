class GraphController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:post,:show,:tabla]
  protect_from_forgery with: :null_session
  @dato = ""
  def post
    @dato = Dato.new(datos_params)
    @dato.save
  end
  def show
    @dato=Dato.last
  end
  def tabla
    @dato=Dato.last(10)
    data=[]
    for i in 0..9
      data[i]=[i,@dato[i].enegiaEntrada.to_f]
    end
    puts(data[0][1])
    return data
  end

  def datos_params
    params.require(:dato).permit(:presion,:tempeatura,:humedad,:carga,:clima,:enegiaEntrada,:energiaSalida)
  end
end
