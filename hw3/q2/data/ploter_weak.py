from matplotlib import pyplot as plt;
from matplotlib import colors
from scipy.stats import linregress
#from pylab import genfromtxt;
import numpy as np
data = np.genfromtxt("q2_weak.dat",delimiter=",");
size = (data[:,0]-1)
time = data[:,1]
plt.figure(0)
plt.scatter(size,time,marker="o",color='blue' );
plt.plot(size,time,color='black')
plt.xlabel('number of cores')
plt.ylabel('time (s)')
plt.title('time vs cores')
##plt.show()
plt.savefig('timeq2_weak.png')

plt.figure(1)
speedup = data[0,1]/time
plt.scatter(size,speedup,marker="o",color='blue' );
print linregress(1./size,1./speedup)
plt.plot(size,speedup,color='black')
plt.xlabel('number of cores')
plt.ylabel('speedup')
plt.title('speedup vs cores')
plt.savefig('speedupq2_weak.png')

plt.figure(2)
speedup = data[0,1]/time
plt.scatter(1./size,1./speedup,marker="o",color='blue' );
plt.plot(1./size,1./speedup,color='black')
plt.xlabel('1/(number of cores)')
plt.ylabel('1/speedup')
plt.title('1/speedup vs 1/cores')
plt.savefig('inversespeedupq2_weak.png')

plt.figure(3)
plt.scatter(size,speedup*size,marker="o",color='blue' );
plt.plot(size,speedup*size,color='black')
plt.xlabel('number of cores')
plt.ylabel('speedup*number of cores')
plt.title('speedup*cores vs cores')
plt.savefig('speed_coresq2_weak.png')
print 'Karp-Flatt Metric'
f = speedup
for i in range(1,len(speedup)):
    fd = (1.-1./size[i])
    f[i] = (1./speedup[i] - 1./size[i])/(1.-1./size[i])
print np.mean(f), '+/-', np.std(f)
