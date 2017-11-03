class HomeController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:index,:about,:createUser,:post,:show,:tabla]
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

  end

  def index
  end
  def about
    #code
  end
  def menu
    @dato=Dato.last(50)
    @data=[]
    for i in 0..49
      @data[i]=[i,@dato[i].enegiaEntrada.to_f]
    end
    puts(@data[0][1])
    return @data
  end
  def createUser
    @user = User.new
  end

  def createUserP
    @user = User.new(admin_params)
    @user.save
    redirect_to home_createUser_path
  end
  def consumo

  end
  def ambiente

  end
private

  def datos_params
    params.require(:dato).permit(:presion,:tempeatura,:humedad,:carga,:clima,:enegiaEntrada,:energiaSalida)
  end

  def admin_params
    if current_user.admin
      params.require(:user).permit(:email,:password,:password_confirmation,:admin)
    end
  end
end
