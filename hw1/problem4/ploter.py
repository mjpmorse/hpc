from matplotlib import pyplot;
#from pylab import genfromtxt;
import numpy as np
import math as mth
#mat0 = genfromtxt("data0.txt");
data = np.genfromtxt("problem4.txt",delimiter=",");
#print mat1[1:3,:]
mytime = pyplot.scatter(np.log(data[1:,0]/np.log(4.)), data[1:,1],marker=".");
other  = pyplot.scatter(np.log(data[1:,0]/np.log(4.)), data[1:,2],marker=".");
pyplot.(np.log(data[1:,0]/np.log(4.)), data[1:,1],marker=".");
pyplot.(np.log(data[1:,0]/np.log(4.)), data[1:,2],marker=".");
#icolumnFirst = pyplot.scatter(ifort[1:,0], ifoty[1:,2],marker=".");
pyplot.legend((mytime,other),('mytime','notmytime'));
pyplot.savefig('compare.png')
