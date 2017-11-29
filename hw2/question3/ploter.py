from matplotlib import pyplot;
#from pylab import genfromtxt;
import numpy as np
data = np.genfromtxt("data0.dat",delimiter=",");


pyplot.scatter(data[:,0], data[:,1],marker=".");



#pyplot.plot(gfort[1:,0], gfort[1:,1],marker=".");
#pyplot.plot(gfort[1:,0], gfort[1:,2],marker=".");
#pyplot.plot(ifort[1:,0], ifort[1:,1],marker=".");
#pyplot.plot(ifort[1:,0], ifort[1:,2],marker=".");
#pyplot.legend((growFirst,gcolumnFirst,irowFirst,icolumnFirst,
#growFirsto,gcolumnFirsto,irowFirsto,icolumnFirsto), \
#('Row First gFort','Column First gFort','Row First iFort','Column First iFort',\
#'Row First gFort -O3','Column First gFort -O3','Row First iFort-O3','Column First iFort -O3'));
pyplot.xlabel('imagionary axis')
pyplot.ylabel('real axis')
pyplot.title('Mandelbrot set')
pyplot.savefig('mandelbrot.png')
