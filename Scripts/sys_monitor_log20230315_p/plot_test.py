#!/usr/bin/env python3
#  coding:utf-8 
import sys

name = sys.argv[1]
filename = name+'.txt'

def load_data(filepath):

    with open(filepath,'r+') as fp:
        lines = fp.readlines()
        print(len(lines))
        date = []
        first = []
        second = []
        i = 1
        for line in lines:
            try:
                line = line.strip().split()
                date.append(line[0])
                # print(date)
                first.append(float(line[1]))
                # print(first)
                second.append(float(line[2]))
                # print(second)
                i+=1
            except Exception as e:
                print("第{}行异常：{}".format(i,str(e)))

        
if __name__ =='__main__':
    load_data(filename)
