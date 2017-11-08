from numpy import array
import requests

def send():
    savehour="0"
    while(True):
        f=file("acuriteweather.CSV","r")
        url='https://ceibasolar.herokuapp.com/home/post'
        u=requests.get(url)
        n=f.readlines()[-1]
        a=n.replace('\"','').replace('\r\n','').split(",")
        leng=len(a)
        time=a[0]
        temp=a[1]
        hum=a[2]
        presion=a[6]
        lluvia=a[7]
        windSpeed=a[8]
        windDir=a[11]
        if(a[0]!=savehour):
            print "entre"
            payload = {'dato[humedad]': hum, 'dato[presion]': presion, 'dato[tempeatura]': temp, 'dato[precipitacion]': lluvia, 'dato[windSpeed]': windSpeed, 'dato[windDir]': windDir}
            r = requests.post(url, data=payload)
            savehour=a[0]
        f.close()
send()
