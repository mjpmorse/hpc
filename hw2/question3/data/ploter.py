from matplotlib import pyplot as plt;
from matplotlib import colors
#from pylab import genfromtxt;
import numpy as np
data = np.genfromtxt("data_a.dat",delimiter=",");


plt.scatter(data[:,0], data[:,1],marker=",",color='black',s=1 );
for i in range(1,len(data[:,0])):
    if data[i,0]**2 + data[i,1]**2 > 4 :
        print 'you fucked up'
        print data[i,:]


plt.ylabel('imagionary axis')
plt.xlabel('real axis')
plt.title('Mandelbrot set')
plt.savefig('mandelbrot.png')
