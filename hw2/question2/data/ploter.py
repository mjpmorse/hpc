from matplotlib import pyplot;
#from pylab import genfromtxt;
import numpy as np
#data = np.genfromtxt("problem4.txt",delimiter=",");
data = np.genfromtxt("dataq2.dat",delimiter=",");
mytime = pyplot.scatter(np.log(4.*data[1:,0]/np.log(4.)), data[1:,1]*10.**3,marker=".");
#pyplot.plot(np.log(data[1:,0]/np.log(4.)), data[1:,1]);
#pyplot.plot(np.log(data[1:,0]/np.log(4.)), data[1:,2]);
#labels = [1,4,16,256,'1K','4K','16K','64K','256K','1M','4M','16M','64M','256M']
#pyplot.xticks(np.log(data[1:,0]/np.log(4.)),labels)
pyplot.xlabel('Log_4 Vector Size in Bytes')
pyplot.ylabel('Time(ms)')
pyplot.title("Ping-Pong")
pyplot.savefig('pingpong.png')
