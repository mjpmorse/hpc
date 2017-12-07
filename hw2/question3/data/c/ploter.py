from matplotlib import pyplot as plt;
from matplotlib import colors
#from pylab import genfromtxt;
import numpy as np
data = np.genfromtxt("time_c.txt",delimiter=",");


plt.scatter(1./data[:,0], data[:,1],marker="o",color='blue',s=15 );
plt.plot(1./data[:,0], data[:,1],color='black' );
#for i in range(1,len(data[:,0])):
#    if data[i,0]**2 + data[i,1]**2 > 4 :
#        print 'you fucked up'
#        print data[i,:]


plt.ylabel('time')
plt.xlabel('1/procs')
plt.title('time vs 1/procs')
#plt.show()
plt.savefig('timevproc.png')
