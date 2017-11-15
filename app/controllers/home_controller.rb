class HomeController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:index,:about,:createUser,:post,:show,:tabla]
  protect_from_forgery with: :null_session
  @dato = ""

  def post
    @dato = Dato.new
    @dato.presion = datos_params[:presion]
    @dato.presion = datos_params[:tempeatura]
    @dato.presion = datos_params[:humedad]
    @dato.presion = datos_params[:carga]
    @dato.presion = datos_params[:clima]
    @dato.presion = datos_params[:enegiaEntrada]
    @dato.presion = datos_params[:energiaSalida]
    @dato.presion = datos_params[:precipitacion]
    @dato.presion = datos_params[:windSpeed]
    @dato.presion = datos_params[:windDir]
    @dato.presion = datos_params[:cbateria]
    flag = Dato.last.cbateria
    if flag == nil
      @dato.presion = datos_params[:cconsumo]
    else
      @dato.presion = datos_params[:cconsumo] + flag
    end

    @dato.save
  end

  def show
    @dato=Dato.last
  end
def precipitacion
  @data=[]
  if Dato.last == nil
    for i in 0..9
      @data[i]=0
    end
  else
    if Dato.all.size<100
      @dato=Dato.all()
      for i in 0..@dato.size-1
        @data[i]=[i*12,@dato[i].precipitacion.to_f]
      end
    else
      @dato=Dato.last(100)
      for i in 0..99
        @data[i]=[i*12,@dato[i].precipitacion.to_f]
      end
    end
  end
end

def presionAtm
  @data=[]
  if Dato.last == nil
    for i in 0..9
      @data[i]=0
    end
  else
    if Dato.all.size<100
      @dato=Dato.all()
      for i in 0..@dato.size-1
        @data[i]=[i*12,@dato[i].presion.to_f]
      end
    else
      @dato=Dato.last(100)
      for i in 0..99
        @data[i]=[i*12,@dato[i].presion.to_f]
      end
    end
  end
end

  def dirwind
    @data=[]
    if Dato.last == nil
      for i in 0..9
        @data[i]=0
      end
    else
      if Dato.all.size<100
        @dato=Dato.all()
        for i in 0..@dato.size-1
          @data[i]=[i*12,@dato[i].windDir.to_f]
        end
      else
        @dato=Dato.last(100)
        for i in 0..99
          @data[i]=[i*12,@dato[i].windDir.to_f]
        end
      end
    end
  end

  def windspeed
    @data=[]
    if Dato.last == nil
      for i in 0..9
        @data[i]=0
      end
    else
      if Dato.all.size<100
        @dato=Dato.all()
        for i in 0..@dato.size-1
          @data[i]=[i*12,@dato[i].windSpeed.to_f]
        end
      else
        @dato=Dato.last(100)
        for i in 0..99
          @data[i]=[i*12,@dato[i].windSpeed.to_f]
        end
      end
    end
  end

  def humedad
    @data=[]
    if Dato.last == nil
      for i in 0..9
        @data[i]=0
      end
    else
      if Dato.all.size<100
        @dato=Dato.all()
        for i in 0..@dato.size-1
          @data[i]=[i*12,@dato[i].humedad.to_f]
        end
      else
        @dato=Dato.last(100)
        for i in 0..99
          @data[i]=[i*12,@dato[i].humedad.to_f]
        end
      end
    end
  end

  def temperatura
    @data=[]
    if Dato.last == nil
      for i in 0..9
        @data[i]=0
      end
    else
      if Dato.all.size<100
        @dato=Dato.all()
        for i in 0..@dato.size-1
          @data[i]=[i*12,@dato[i].tempeatura.to_f]
        end
      else
        @dato=Dato.last(100)
        for i in 0..99
          @data[i]=[i*12,@dato[i].tempeatura.to_f]
        end
      end
    end
  end


  def index
  end

  def about
    #code
  end


  def menu
    @almacenado = 120
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
    if Dato.last.cconsumo == nil
      @datac=0.0
    else
      @datac=Dato.last.cconsumo      #code
    end
  end

  def ambiente
    if Dato.last==nil
      @temperatura = 0.0
      @humedad = 0.0
      @velocidadViento = 0.0
      @direccionViento = 0.0
      @presionAtm = 0.0
      @precipitaciones = 0.0
    else
      @temperatura = Dato.last().tempeatura.to_f
      @humedad = Dato.last().humedad.to_f
      @velocidadViento = Dato.last().windSpeed.to_f
      @direccionViento = Dato.last().windDir.to_f
      @presionAtm = Dato.last().presion.to_f
      @precipitaciones = Dato.last().precipitacion.to_f
    end
  end

private

  def datos_params
    params.require(:dato).permit(:presion,:tempeatura,:humedad,:carga,:clima,:enegiaEntrada,:energiaSalida,:precipitacion,:windSpeed,:windDir,:cbateria,:cconsumo)
  end

  def admin_params
    if current_user.admin
      params.require(:user).permit(:email,:password,:password_confirmation,:admin)
    end
  end
end
