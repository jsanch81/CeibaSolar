import time
import random
from numpy import array
import requests


controlcarga=0
def randrange_float(start, stop, step):
    return random.randint(0, int((stop - start) / step)) * step + start

def humedity(T, r):
    if(T>24):
        R=random.randint(30,50)
    if(T>22 and T<25):
        R=random.randint(40,60)
    if(T<23):
        R=random.randint(60,70)
    return(R)

def temperature(r):

    hour = int(time.ctime().split()[3].split(':')[0])
    if(hour<6):
        T=randrange_float(18.0, 20.0, 0.0001)
    if(hour>5 and hour<9):
        T=randrange_float(20.0, 21.0, 0.0001)
    if(hour>8 and hour<12):
        T=randrange_float(21.0, 23.0, 0.0001)
    if(hour>11 and hour<15):
        T=randrange_float(24.0, 27.0, 0.0001)
    if(hour>14 and hour<18):
        T=randrange_float(22.0, 25.0, 0.0001)
    if(hour>17 and hour<21):
        T=randrange_float(18.0, 22.0, 0.0001)
    if(hour>20 and hour<24):
        T=randrange_float(18.0, 20.0, 0.0001)
    return(T)

def pressure():
    P=0.84
    return(P)

def weather(x):
    a=array([0,0,0,0])
    r=True
    if(x):
        tem=temperature(r)
        pre=pressure()
        hum=humedity(tem, r)
        if(hum<65 and tem>22):
            state=1.0
            staten='Sunny'
        else:
            state=0
            staten='Cloudy'
        #print(staten)
        #print(tem,pre,hum)
        a=[state, tem, pre , hum]

        return(a)
    return(a)

def charge(chargea):

    st=array([0, 0, 0, 0])
    st=weather(True)
    if(st[0]>0):
        if(chargea<200):
            solarE=randrange_float(22.0,25.0,2)*6
            hora=1
            solarT=(solarE*hora)/1000
            electricE=(1000*solarT)/7.83
            chargea=(chargea+electricE)
            if (chargea>200):
                chargea=200
    else:
        if(chargea<200):
            solarE=randrange_float(5.0,11.0,2)*6
            hora=1
            solarT=(solarE*hora)/1000
            electricE=(1000*solarT)/7.83
            chargea+=electricE
            if(chargea>200):
                chargea=200
    #print(chargea)
    nn=random.randint(0,8)
    i=0
    uncharge=0
    while(i<nn and charge>uncharge):
        typ=random.randint(1,2)
        uncharge=(typ*3)
        chargea-=uncharge
        if(chargea<0):
            chargea=0
        i+=1
    #print(chargea)
    return(chargea)


def main(x):
    send=False
    chargea=random.randint(1,20)
    chargea=charge(chargea)
    P=pressure()
    Te=temperature(send)
    H=humedity(0,send)
    time.sleep(1)
    #print(P,H,Te)
    if(x==0):
        return(P)
    if(x==1):
        return(H)
    if(x==2):
        return(Te)
    if(x==3):
        if(H<65 and Te>22):
            return('Sunny')
        else:
            return('Cloudy')
    if(x==4):
        return(chargea)
    return(0)


def postSend():
    payload=array([])
    while(True):
        url='http://localhost:3000/graph/show'
        u=requests.get(url)
        Presion=main(0)
        Temperatura=main(2)
        Humedad=main(1)
        Carga=main(4)
        Clima=main(3)
        payload = {'key1': str(Humedad), 'key2': str(Carga), 'key3': str(Presion), 'key4': Clima, 'key5': str(Temperatura)}
        #print(payload)
        r = requests.post(url, data=payload)
    return(0)

postSend()
