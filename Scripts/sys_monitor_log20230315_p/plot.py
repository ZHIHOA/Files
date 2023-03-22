import matplotlib.pyplot as plt
import sys
import os
name = sys.argv[1]
filename = name+'.txt'
picturename = './plot_sys_source/'+name+'.png'
titlename = name+' cpu-mem status'

interval=14
hour=3600/interval
def Hour(n):
    ret=n*hour*1.5
    return ret
def loadData(filePath):
    fr = open(filePath, 'r+')
    lines = fr.readlines()
    Date = []
    Begin = []
    End = []
    for line in lines:
        items = line.strip().split(' ')
        Date.append(items[0])
        try:
            Begin.append(float(items[1]))
        except Exception as e:
            raise e 
        End.append(float(items[2]))
    return Date, Begin, End


    
if __name__ == '__main__':
    size = os.path.getsize(filename)
    if(size==0):
        print(f"--**--{name}--**-- file is null")
    else:
        print(f"--**--{name}--**-- Done")
    Date, Begin, End = loadData(filename)
    num=int((len(Date)*interval)/3600)+1
    MyDate=[]
    for i in range(num):
        MyDate.append(Hour(i))
    plt.title('%s' %titlename)
    plt.xlabel('time')
    plt.ylabel('%')
    ax = plt.gca()
    ax.axes.xaxis.set_ticks(MyDate)
    plt.plot(Date, Begin, label='cpu')
    plt.plot(Date, End, label='mem')
    plt.legend()
    plt.savefig('%s' %picturename)
    #plt.show()
