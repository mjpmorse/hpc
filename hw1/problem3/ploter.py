from matplotlib import pyplot;
#from pylab import genfromtxt;
import numpy as np
#mat0 = genfromtxt("data0.txt");
gfort = np.genfromtxt("datag.txt",delimiter=",");
ifort = np.genfromtxt("datai.txt",delimiter=",");
#print mat1[1:3,:]
growFirst = pyplot.scatter(gfort[1:,0], gfort[1:,1],marker=".");
gcolumnFirst = pyplot.scatter(gfort[1:,0], gfoty[1:,2],marker=".");
igrowFirst = pyplot.scatter(ifort[1:,0], ifort[1:,1],marker=".");
icolumnFirst = pyplot.scatter(ifort[1:,0], ifoty[1:,2],marker=".");
pyplot.legend((growFirst,gcolumnFirst,irowFirst,icolumnFirst),('Row First gFort','Column First gFort','Row First iFort','Column First iFort'));
pyplot.savefig('compare.png')
