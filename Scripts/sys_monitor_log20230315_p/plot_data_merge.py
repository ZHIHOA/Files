import matplotlib.pyplot as plt
import sys

name = sys.argv[1]
step = sys.argv[2]
step_int = int(step)
filename = name+'.txt'
picturename = './plot_sys_source/'+name+'.png'
titlename = name+' cpu-mem status'

interval=14
hour=3600/interval
def Hour(n):
    ret=n*hour
    return ret

def loadData(filePath):
    fr = open(filePath, 'r+')
    lines = fr.readlines()
    Date = []
    Cpu = []
    Mem = []
    count = []
    tmp_step1_cpu = []
    tmp_step1_mem = []
    for line in lines:
        items = line.strip().split(' ')
        Date.append(items[0])
        tmp_step1_cpu.append(float(items[1]))
        tmp_step1_mem.append(float(items[2]))
    tmp_step2_cpu = [tmp_step1_cpu[i:i+step_int] for i in range(0,len(tmp_step1_cpu),step_int)]
    tmp_step2_mem = [tmp_step1_mem[i:i+step_int] for i in range(0,len(tmp_step1_mem),step_int)]
    sum_cpu=0
    sum_mem=0
    for i in range(len(tmp_step2_cpu)):
        for j in range(len(tmp_step2_cpu[i])):
            sum_cpu+=tmp_step2_cpu[i][j]
        Cpu.append(sum_cpu)
        sum_cpu=0
    for i in range(len(tmp_step2_mem)):
        for j in range(len(tmp_step2_mem[i])):
            sum_mem+=tmp_step2_mem[i][j]
        Mem.append(sum_mem)
        sum_mem=0
    Cpu.pop()
    Mem.pop()
    for i in range(len(Mem)):
        count.append(i)
    return count, Cpu, Mem
 
if __name__ == '__main__':
    Date, Cpu, Mem = loadData(filename)
    num=(len(Date)*interval)/3600+1
    MyDate=[]
    for i in range(int(num)):
        MyDate.append(Hour(i))
    plt.title('%s' %titlename)
    plt.xlabel('Number of point')
    plt.ylabel('%')
    ax = plt.gca()
    ax.axes.xaxis.set_ticks(MyDate)
    plt.plot(Date, Cpu, label='cpu')
    plt.plot(Date, Mem, label='mem')
    plt.legend()
    plt.savefig('%s' %picturename)


