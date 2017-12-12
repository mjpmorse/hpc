from matplotlib import pyplot as plt;
from matplotlib import colors
from scipy.stats import linregress
#from pylab import genfromtxt;
import numpy as np
data = np.genfromtxt("q2_strong.dat",delimiter=",");
size = (data[:,0]-1)
time = data[:,1]
plt.figure(0)
plt.scatter(size,time,marker="o",color='blue' );
plt.plot(size,time,color='black')
plt.xlabel('number of nodes')
plt.ylabel('time (s)')
plt.title('time vs nodes')
##plt.show()
plt.savefig('timevsnodes.png')

plt.figure(1)
speedup = data[0,1]/time
plt.scatter(size,speedup,marker="o",color='blue' );
plt.plot(size,speedup,color='black')
plt.xlabel('number of nodes')
plt.ylabel('speedup')
plt.title('speedup vs nodes')
plt.savefig('speedupvsnode.png')

plt.figure(2)
speedup = data[0,1]/time
plt.scatter(1./size,1./speedup,marker="o",color='blue' );
m,b = np.polyfit(1./size,1./speedup,1)
print m,b
print linregress(1./size[2:],1./speedup[2:])
plt.plot(1./size,1./speedup,color='black')
plt.xlabel('1/(number of cores)')
plt.ylabel('1/speedup')
plt.title('1/speedup vs 1/cores')
plt.savefig('inversespeedup.png')
