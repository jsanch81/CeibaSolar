# Importamos la libreira de PySerial
import serial
import random
from numpy import array
import requests

# Abrimos el puerto del arduino a 9600
PuertoSerie = serial.Serial('/dev/ttyACM0', 9600)
# Creamos un buble sin fin
while True:
  url='http://localhost:3000/home/post'
  # leemos hasta que encontarmos el final de linea
  sArduino = PuertoSerie.readline()
  payload = sArduino
  # Mostramos el valor leido y eliminamos el salto de linea del fina
  r = requests.post(url, data=payload)
  print "Valor Arduino: " + sArduino.rstrip('\n')
