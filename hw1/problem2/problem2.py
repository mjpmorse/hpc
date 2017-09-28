

fcl = [0.01,0.5,0.99]

cc= 2.0   #cache cycles/word
mc=100.0  #main memory cycles/word
proc=2.0  # GHz/second


for fc in fcl:
    avgc= fc*cc+(1-fc)*mc #cycles/word
    rho = (2.0)*10**3          #cycles/second
    wps = proc*(1.0/avgc) #word/second
    flopsps = wps*rho     #Mflops/second
    print 'Predicted performance for f_c of ',fc ,' is: ' ,'%.2f'%( flopsps), ' MFlops/Second'
