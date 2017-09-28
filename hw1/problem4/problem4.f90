       program problem4
         implicit none
         real*4, DIMENSION(:),ALLOCATABLE :: v1
         real*4, DIMENSION(:),ALLOCATABLE :: v2
         real*4, DIMENSION(:),ALLOCATABLE :: v3
         real*4, DIMENSION(:),ALLOCATABLE :: v4
         integer n,m
         integer i,j
         real*4 random1
         real*4 random2
         real seed
         real start1,start2
         real stop1,stop2


         call RANDOM_SEED()
         open(unit=1,file="problem4.txt")
         write(1,*) "Vector Size, ",'My L1 BLAS, ',
      &                           'NETLIB L1 BLAS'

         m = 1
         do n = 1,16000,m
           ALLOCATE(v1 (n))
           ALLOCATE(v2 (n))
           ALLOCATE(v3 (n))
           ALLOCATE(v4(n))
           do i = 1, n ,1
             call RANDOM_NUMBER(random1)
             call RANDOM_NUMBER(random2)
             m1(i) = random1
             m1(i) = random2
             m = 2*n
           end do

   !my ddot
           call cpu_time(start1)
           do i = 1, n , 1
             v3(i) = v1(i)+v2(i)
           end do
           call cpu_time(stop1)
   !NetLIB L1 BLAS

           call cpu_time(start2)
           call dot(v1,v2,v4)
           call cpu_time(stop2)

           write(1,*) 4*n,',',stop1-start1,',',stop2-start2
           DEALLOCATE(v1)
           DEALLOCATE(v2)
           DEALLOCATE(v3)
           DEALLOCATE(v4)
         end do
         close(1)

       end program
