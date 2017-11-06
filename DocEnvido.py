from numpy import array
import requests

def send():
    savehour="0"
    while(True):
        f=file("acuriteweather_110617.CSV","r")
        url='http://localhost:3000/home/post'
        u=requests.get(url)
        n=f.readlines()[-1]
        a=n.replace('\"','').replace('\r\n','').split(",")

        leng=len(a)
        time=a[0]
        x=time.split(' ')
        hora=x[1]+x[2]
        temp=a[1]
        hum=a[2]
        presion=a[6]
        lluvia=a[7]+'.'+a[8]
        windSpeed=a[9]
        windDir=a[12]+'.'+a[13]
        if(x[1]!=savehour):
            payload = {'dato[humedad]': hum, 'dato[presion]': presion, 'dato[tempeatura]': temp, 'dato[precipitacion]': lluvia, 'dato[windSpeed]': windSpeed, 'dato[windDir]': windDir}
            r = requests.post(url, data=payload)
            savehour=x[1]
        f.close()
send()
