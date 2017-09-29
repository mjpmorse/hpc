       program problem4
         implicit none
         include 'mpif.h'
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
         integer*8 stop1,stop2,countrate
         DOUBLE PRECISION start3,stop3,start4,stop4
         DOUBLE PRECISION :: ddot
         DOUBLE PRECISION myflops,ddotflops,myt,theirt
         double precision numops,time
         real*8 time1,time2 
         call RANDOM_SEED()


         call MPI_INIT(j)
         open(unit=1,file="problem4mkl.txt")
         open(unit=2,file='timesmkl.txt')
         write(1,*) "Vector Size (Mbytes), ",'My L1 BLAS, ' &
     &                ,'NETLIB L1 BLAS'

         n = 1
         do while (n .lt.  1d8)
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
           start3 =  MPI_Wtime()
!           call SYSTEM_CLOCK(start1,countrate)
           do i = 1, n , 1
             mydot =mydot +  v1(i)*v2(i)
           end do
!           call SYSTEM_CLOCK(stop1,countrate)
           stop3 =  MPI_Wtime()


!NetLIB L1 BLAS
           start4 = MPI_Wtime()
!           call SYSTEM_CLOCK(start2,countrate)
           optdot = ddot(n,v1,1,v2,1)
!           call system_clock(stop2,countrate)
           stop4 = MPI_WTime()

           numops  = 2*n  

           myt = (stop3-start3)
           theirt = (stop4-start4)
           myflops = numops/myt/(1d6)
           ddotflops = numops/theirt/(1d6)
           write(1,*) 8* n,',',myflops,',',ddotflops
           write(2,*) myt,theirt
           DEALLOCATE(v1)
           DEALLOCATE(v2)
           n = n*2
         end do
         close(1)
         close(2)
         call MPI_FINALIZE()
       end program
