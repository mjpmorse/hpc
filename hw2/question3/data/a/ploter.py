from matplotlib import pyplot as plt;
from matplotlib import colors
#from pylab import genfromtxt;
import numpy as np
data = np.genfromtxt("data3a_1000grid.data",delimiter=",");


plt.scatter(data[:,0], data[:,1],marker=",",color='black',s=1 );
#for i in range(1,len(data[:,0])):
#    if data[i,0]**2 + data[i,1]**2 > 4 :
#        print 'you fucked up'
#        print data[i,:]


plt.ylabel('imaginary')
plt.xlabel('real')
plt.title('Mandelbrot 1000x1000')
plt.show()
plt.savefig('mandelbrot_fine_a.png')
