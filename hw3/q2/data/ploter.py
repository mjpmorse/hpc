from matplotlib import pyplot as plt;
from matplotlib import colors
#from pylab import genfromtxt;
import numpy as np
data = np.genfromtxt("time.txt",delimiter=",");


plt.scatter(data[:,0], data[:,1],marker=",",color='black',s=1 );


plt.ylabel('time')
plt.xlabel('number of cores')
plt.title('Time to calculate pi vs cores')
plt.savefig('q2_time.png')
