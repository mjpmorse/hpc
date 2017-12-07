from matplotlib import pyplot as plt;
from matplotlib import colors
#from pylab import genfromtxt;
import numpy as np
data = np.genfromtxt("area_3a.txt",delimiter=",");


plt.scatter(data[:,1], data[:,0],marker=",",color='black',s=1 );
#for i in range(1,len(data[:,0])):
#    if data[i,0]**2 + data[i,1]**2 > 4 :
#        print 'you fucked up'
#        print data[i,:]


plt.ylabel('area')
plt.xlabel('grid size')
plt.title('area vs gridsize')
##plt.show()
plt.savefig('area_a.png')
