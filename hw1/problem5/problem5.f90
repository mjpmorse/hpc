       program problem4
         implicit none
         include 'mpif.h'
         DOUBLE PRECISION, DIMENSION(:),ALLOCATABLE :: m1
         DOUBLE PRECISION, DIMENSION(:),ALLOCATABLE :: m2
         DOUBLE PRECISION, DIMENSION(:),ALLOCATABLE :: m3
         DOUBLE PRECISION, DIMENSION(:),ALLOCATABLE :: m4
         DOUBLE PRECISION optdot
         DOUBLE PRECISION mydot
         integer*8 n
         integer i,j
         DOUBLE PRECISION random1, random3
         DOUBLE PRECISION random2, random4
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
           ALLOCATE(v1 (n,n))
           ALLOCATE(v2 (n,n))
           ALLOCATE(v3 (n,n))
           ALLOCATE(v4 (n,n))
           do j = 1, n , 1
           do i = 1, n , 1
             call RANDOM_NUMBER(random1)
             call RANDOM_NUMBER(random2)
             v1(i,j) = random1
             v2(i,j) = random2
           end do
           end do

!my ddot
           mydot= 0
           optdot = 0
           start3 =  MPI_Wtime()
!           call SYSTEM_CLOCK(start1,countrate)
           do i = 1, n , 1
             do j = 1, n , 1
               v3(i,j) = v3(i,j) + v1(i,j)*v2(j,i)
             end do
           end do
!           call SYSTEM_CLOCK(stop1,countrate)
           stop3 =  MPI_Wtime()


!NetLIB L1 BLAS
           start4 = MPI_Wtime()
!           call SYSTEM_CLOCK(start2,countrate)
           v4 = dgemm('n','n',n,n,n,1d0,n,n,n,0)
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
