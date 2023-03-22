#!/usr/bin/env python
#!-*-coding:utf-8-*-
import sys
import matplotlib.pyplot as plt

name=sys.argv[1]
filePath=name+'.txt'
titlename = name+' cpu or mem status'
picturename = './plot_sys_source/'+name+'.png'
interval=8
hour=3600/interval
def Hour(n):
    ret=n*hour*1.5
    return ret
def loadData(filePath):
    fr = open(filePath, 'r+')
    lines = fr.readlines()
    Date = []
    data = []
    for line in lines:
        items = line.strip().split(' ')
        Date.append(items[0])
        data.append(float(items[1]))
        #print(Date,data)
    return Date, data
    
    

if __name__=='__main__':

   date,data=loadData(filePath)
   plt.ylabel('%')
   plt.title(titlename)
   num=(len(date)*interval)/3600+1
   MyDate=[]
   for i in range(int(num)):
        MyDate.append(Hour(i))
   ax=plt.gca()
   ax.xaxis.set_ticks(MyDate)
   plt.plot(date,data,label='io_occupy')
   plt.legend()
   plt.savefig('%s' %picturename)
   plt.show()