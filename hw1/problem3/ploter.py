from matplotlib import pyplot;
#from pylab import genfromtxt;
import numpy as np
#mat0 = genfromtxt("data0.txt");
mat1 = np.genfromtxt("data.txt",delimiter=",");
#print mat1[1:3,:]
rowFirst = pyplot.scatter(mat1[1:,0], mat1[1:,1],marker=".");
columnFirst=pyplot.scatter(mat1[1:,0], mat1[1:,2],marker=".");
pyplot.legend((rowFirst,columnFirst),('Row First','ColumnFirst'));
pyplot.savefig('gcc.png')
