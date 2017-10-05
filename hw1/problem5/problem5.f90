       program problem5
         implicit none
         DOUBLE PRECISION, DIMENSION(:,:),ALLOCATABLE :: m1
         DOUBLE PRECISION, DIMENSION(:,:),ALLOCATABLE :: m2
         DOUBLE PRECISION, DIMENSION(:,:),ALLOCATABLE :: m3
         DOUBLE PRECISION, DIMENSION(:,:),ALLOCATABLE :: m4
         DOUBLE PRECISION optdot
         DOUBLE PRECISION mydot
         integer*8 n
         integer i,j,k
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


         open(unit=1,file="problem5mkl.txt")
         open(unit=2,file='timesmkl.txt')
         write(1,*) "Vector Size (Mbytes), ",'My L3 BLAS, ' &
     &                ,'NETLIB L3 BLAS'

         n = 1
         do while (n .lt.  4097)
           ALLOCATE(m1 (n,n))
           ALLOCATE(m2 (n,n))
           ALLOCATE(m3 (n,n))
           ALLOCATE(m4 (n,n))
           do j = 1, n , 1
           do i = 1, n , 1
             call RANDOM_NUMBER(random1)
             call RANDOM_NUMBER(random2)
             m1(i,j) = random1
             m2(i,j) = random2
           end do
           end do
           numops  = 2*n*n*n

!my ddot
           myflops= 0
           optdot = 0
           if(n .le. 2048) THEN
           call SYSTEM_CLOCK(start1,countrate)
           do i = 1, n , 1
             do j = 1, n , 1
               do k = 1, n ,1
                  m3(i,j) = m3(i,j) + m1(i,k)*m2(k,i)
               end do
             end do
             end do
            call SYSTEM_CLOCK(stop1,countrate)
            myt = (stop1-start1)*1d0/countrate      
            myflops = numops/myt/(1d6)
          end if


!NetLIB L1 BLAS
           call SYSTEM_CLOCK(start2,countrate)
           call dgemm('n','n',n,n,n,1d0,m1,n,m2,n,0d0,m4,n)
           call system_clock(stop2,countrate)



           theirt = (stop2-start2)*1d0/countrate
           ddotflops = numops/theirt/(1d6)
           write(1,*) 8* n*n,',',myflops,',',ddotflops
           write(*,*) 8* n*n,',',myflops,',',ddotflops
           write(2,*) myt,theirt

           DEALLOCATE(m1)
           DEALLOCATE(m2)
           DEALLOCATE(m3)
           DEALLOCATE(m4)
           n = n*2
         end do
         close(1)
         close(2)
       end program
