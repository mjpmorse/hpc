from matplotlib import pyplot;
#from pylab import genfromtxt;
import numpy as np
gfort = np.genfromtxt("datag.txt",delimiter=",");
ifort = np.genfromtxt("datai.txt",delimiter=",");
growFirst = pyplot.scatter(gfort[1:,0], gfort[1:,1],marker=".");
gcolumnFirst = pyplot.scatter(gfort[1:,0], gfort[1:,2],marker=".");
irowFirst = pyplot.scatter(ifort[1:,0], ifort[1:,1],marker=".");
icolumnFirst = pyplot.scatter(ifort[1:,0], ifort[1:,2],marker=".");
#pyplot.plot(gfort[1:,0], gfort[1:,1],marker=".");
#pyplot.plot(gfort[1:,0], gfort[1:,2],marker=".");
#pyplot.plot(ifort[1:,0], ifort[1:,1],marker=".");
#pyplot.plot(ifort[1:,0], ifort[1:,2],marker=".");
pyplot.legend((growFirst,gcolumnFirst,irowFirst,icolumnFirst),('Row First gFort','Column First gFort','Row First iFort','Column First iFort'));
pyplot.xlabel('matrix size')
pyplot.ylabel('time (s)')
pyplot.title('Matrix Addition under diffferent conditions')
pyplot.savefig('compare.png')
