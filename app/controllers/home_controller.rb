class HomeController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:index,:about,:createUser,:post,:show,:tabla]
  protect_from_forgery with: :null_session
  @dato = ""

  def post
    @dato = Dato.new(datos_params)
    @dato.save
  end
  def post2

    @dato.Datoc.new
    @dato.cbateria = params_data[:cbateria]
    flag = Datoc.last.cbateria
    if flag == nil
      @dato.cconsumo = params_data[:cconsumo]
    else
      @dato.cconsumo = (params_data[:cconsumo].to_f + flag.to_f).to_s
    end
    @dato.save
  end

def show
    @dato=Dato.last  end
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
    if Datoc.last == nil
      @datac=0.0
    else
      @datac=Datoc.last.cconsumo      #code
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
    params.require(:dato).permit(:presion,:tempeatura,:humedad,:carga,:clima,:enegiaEntrada,:energiaSalida,:precipitacion,:windSpeed,:windDir)
  end
def params_data
  params.require(:datoc).permit(:cbateria,:cconsumo)
end
  def admin_params
    if current_user.admin
      params.require(:user).permit(:email,:password,:password_confirmation,:admin)
    end
  end
end
