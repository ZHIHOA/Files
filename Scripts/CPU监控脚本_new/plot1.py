import matplotlib.pyplot as plt
import sys
import re
interval=14
hour=3600/interval
def Hour(n):
    ret=n*hour
    return ret
name = sys.argv[1]
filename = name+'.txt'
picturename = './plot_sys_source/'+name+'.png'
titlename = name+' cpu or mem status'
def loadData(filePath):
    fr = open(filePath, 'r+')
    lines = fr.readlines()
    Date = []
    Begin = []
    if(BF(name,"temper")):
        for line in lines:
            items = line.strip().split(' ')
            Date.append(items[0])
            results=re.findall( r'\d+\.+\d', items[1])
            target=results[0]
            Begin.append(float(target))
            plt.ylabel('degree')
    else:
        for line in lines:
            items = line.strip().split(' ')
            Date.append(items[0])
            Begin.append(float(items[1]))
            plt.ylabel('%')
    return Date, Begin
def BF(s,p):
	n1 = len(s)
	n2 = len(p)
	i,j = 0,0
	while i < n1 and j < n2:
		if s[i] == p[j]:
			i += 1
			j += 1
		else:
			i = i - j + 1
			j = 0
	if j == n2:
		return 1
	else:
		return 0
if __name__ == '__main__':
    Date, Begin = loadData(filename)
    num=(len(Date)*interval)/3600+1
    MyDate=[]
    for i in range(int(num)):
        MyDate.append(Hour(i))
    plt.title('%s' %titlename)
    plt.xlabel('time')
    ax = plt.gca()
    ax.axes.xaxis.set_ticks(MyDate)
    if(BF(name,"cpu")):
        plt.plot(Date, Begin, label='cpu')
        if(BF(name,"cpu-over")):
            plt.ylim((800, 3200)) # 66/69的Max为3200,最小为800
    if(BF(name,"mem")):
        plt.plot(Date, Begin, label='mem')
    plt.legend()
    plt.savefig('%s' %picturename)

