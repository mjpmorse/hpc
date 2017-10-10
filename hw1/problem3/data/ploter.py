from matplotlib import pyplot;
#from pylab import genfromtxt;
import numpy as np
gfort = np.genfromtxt("datag.txt",delimiter=",");
ifort = np.genfromtxt("dataintel.txt",delimiter=",");
gforto = np.genfromtxt("datagO3.txt",delimiter=",");
iforto = np.genfromtxt("dataiO3.txt",delimiter=",");

growFirst = pyplot.scatter(gfort[1:,0], gfort[1:,1],marker=".");
gcolumnFirst = pyplot.scatter(gfort[1:,0], gfort[1:,2],marker=".");
irowFirst = pyplot.scatter(ifort[1:,0], ifort[1:,1],marker=".");
icolumnFirst = pyplot.scatter(ifort[1:,0], ifort[1:,2],marker=".");

growFirsto = pyplot.scatter(gforto[1:,0], gforto[1:,1],marker="X");
gcolumnFirsto = pyplot.scatter(gforto[1:,0], gforto[1:,2],marker="X");
irowFirsto = pyplot.scatter(iforto[1:,0], iforto[1:,1],marker="X");
icolumnFirsto = pyplot.scatter(iforto[1:,0], iforto[1:,2],marker="X");
#pyplot.plot(gfort[1:,0], gfort[1:,1],marker=".");
#pyplot.plot(gfort[1:,0], gfort[1:,2],marker=".");
#pyplot.plot(ifort[1:,0], ifort[1:,1],marker=".");
#pyplot.plot(ifort[1:,0], ifort[1:,2],marker=".");
pyplot.legend((growFirst,gcolumnFirst,irowFirst,icolumnFirst,
growFirsto,gcolumnFirsto,irowFirsto,icolumnFirsto), \
('Row First gFort','Column First gFort','Row First iFort','Column First iFort',\
'Row First gFort -O3','Column First gFort -O3','Row First iFort-O3','Column First iFort -O3'));
pyplot.xlabel('matrix size')
pyplot.ylabel('time (s)')
pyplot.title('Matrix Addition under diffferent conditions')
pyplot.savefig('compare.png')
