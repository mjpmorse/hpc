       program problem4
         implicit none
         DOUBLE PRECISION, DIMENSION(:),ALLOCATABLE :: v1
         DOUBLE PRECISION, DIMENSION(:),ALLOCATABLE :: v2
         DOUBLE PRECISION optdot
         DOUBLE PRECISION mydot
         integer*8 n
         integer i,j
         DOUBLE PRECISION random1
         DOUBLE PRECISION random2
         real seed
         integer*8 start1,start2
         integer*8 stop1,stop2
         integer*8 start3,stop3,countrate
         DOUBLE PRECISION :: ddot
         DOUBLE PRECISION myflops,ddotflops,myt,theirt
         double precision numops,time
         call RANDOM_SEED()
         open(unit=1,file="problem4.txt")
         write(1,*) "Vector Size (Mbytes), ",'My L1 BLAS, ' &
     &                ,'NETLIB L1 BLAS'

         n = 1
         do while (n .lt.  8d10)
           ALLOCATE(v1 (n))
           ALLOCATE(v2 (n))
           do i = 1, n ,1
             call RANDOM_NUMBER(random1)
             call RANDOM_NUMBER(random2)
             v1(i) = random1
             v2(i) = random2
           end do

!my ddot  
           mydot= 0
           optdot = 0
           call SYSTEM_CLOCK(start1,countrate)
           do i = 1, n , 1
             mydot =mydot +  v1(i)*v2(i)
           end do
           call SYSTEM_CLOCK(stop1,countrate)
!NetLIB L1 BLAS

           call SYSTEM_CLOCK(start2,countrate)
           optdot = ddot(n,v1,1,v2,1)
           call system_clock(stop2,countrate)
           numops  = 2*n  
           myt = (stop1-start1)*1d0/countrate
           theirt = (stop2-start2)*1d0/countrate
           myflops = numops/myt/(1d6)
           ddotflops = numops/theirt/(1d6)
           time = (stop3-start3)*1d0/countrate

           write(1,*) 8* n,',',myflops,',',ddotflops
           DEALLOCATE(v1)
           DEALLOCATE(v2)
           n = n*2
         end do
         close(1)

       end program
