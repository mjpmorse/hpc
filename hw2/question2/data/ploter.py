from matplotlib import pyplot;
#from pylab import genfromtxt;
import numpy as np
data = np.genfromtxt("dataq2.dat",delimiter=",");
mytime = pyplot.scatter(np.log(data[1:,0])/np.log(4.)), data[1:,1]*10.**3,marker=".");
pyplot.xlabel('Log_4 Vector Size in Bytes')
pyplot.ylabel('Time(ms)')
pyplot.title("Ping-Pong")
pyplot.savefig('pingpong.png')
