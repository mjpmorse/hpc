from matplotlib import pyplot as plt;
from matplotlib import colors
#from pylab import genfromtxt;
import numpy as np
data = np.genfromtxt("data0.dat",delimiter=",");

data2 = [data[:,0],data[:,1]]
fig = plt.figure()
ax = fig.add_subplot(111)
ax.imshow(data, aspect='auto', cmap=plt.cm.gray, interpolation='nearest')
g = data
plt.subplot(211)
plt.imshow(g)
plt.subplot(212)
plt.imshow(g, cmap='Greys',  interpolation='nearest')
plt.savefig('blkwht.png')

plt.show()
#pyplot.scatter(data[:,0], data[:,1],marker=",",color='black',s=1 );
for i in range(1,len(data[:,0])):
    if data[i,0]**2 + data[i,1]**2 > 4 :
        print 'you fucked up'
        print data[i,:]


#pyplot.plot(gfort[1:,0], gfort[1:,1],marker=".");
#pyplot.plot(gfort[1:,0], gfort[1:,2],marker=".");
#pyplot.plot(ifort[1:,0], ifort[1:,1],marker=".");
#pyplot.plot(ifort[1:,0], ifort[1:,2],marker=".");
#pyplot.legend((growFirst,gcolumnFirst,irowFirst,icolumnFirst,
#growFirsto,gcolumnFirsto,irowFirsto,icolumnFirsto), \
#('Row First gFort','Column First gFort','Row First iFort','Column First iFort',\
#'Row First gFort -O3','Column First gFort -O3','Row First iFort-O3','Column First iFort -O3'));
#pyplot.ylabel('imagionary axis')
#pyplot.xlabel('real axis')
#pyplot.title('Mandelbrot set')
#pyplot.show()
#pyplot.savefig('mandelbrot4.png')
