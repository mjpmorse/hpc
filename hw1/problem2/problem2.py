from matplotlib import pyplot;
import numpy as np;
def frange(start, stop, step):
     i = start
     while i < stop:
         yield i
         i += step

fcl = [0.01,0.99]

cc= 2.0   #cache cycles/word
mc=100.0  #main memory cycles/word
proc=2.0  # GHz/second


for fc in frange(0,1,0.05):
    avgc= fc*cc+(1-fc)*mc #cycles/word
    rho = (2.0)*10**3     #cycles/second
    wps = proc*(1.0/avgc) #word/second
    flopsps = wps*rho     #Mflops/second
    pyplot.scatter(fc,flopsps,color='red')

for fc in fcl:
    avgc= fc*cc+(1-fc)*mc #cycles/word
    rho = (2.0)*10**3     #cycles/second
    wps = proc*(1.0/avgc) #word/second
    flopsps = wps*rho     #Mflops/second
    print 'Predicted performance for f_c of ',fc ,' is: ' ,'%.2f'%( flopsps), ' MFlops/Second'
pyplot.xlabel('f_c')
pyplot.ylabel('MFlops')
pyplot.title("MFLOPS vs f_c")
pyplot.savefig('compare.png')


#
