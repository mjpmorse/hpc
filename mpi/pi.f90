       program ppi
         use mpi
         implicit none
         double precision PI25DT
         parameter (PI25DT = 3.141592653589793238462643d0)
         double precision mypi,pi,h,sum,x,f,a,sum2.pi2
         integer n,myid,numprocs,i,ierr

! function to integrate
         f(a) = 4.0d0/(1.0d0+a*a)
         g(a) = 4*(1-a*a)**(0.5)

         call MPI_INIT(ierr)
         call MPI_COMM_RANK(MPI_COMM_WORLD,myid,ierr)
         call MPI_COMM_SIZE(MPI_COMM_WORLD,numprocs,ierr)

!10       if (myid .eq. 0) then
!           write(*,*) 'Enter number of intervals: (0 quits) '
!           read(*,*)   n
!         end if
         n = 1d10

         call MPI_BCAST(n,1,MPI_INTEGER,0,MPI_COMM_WORLD,ierr)

         if (n .le. 0) goto 30

         h = 1.0d0/n
         sum = 0.0d0
         sum2 = 0.0d0
         do 20 i = myid +1,n,numprocs
           x = h * (dble(i) - 0.5d0)
           sum = sum +f(x)
           sum2 = sum2 + g(x)
           ! rectangles are number of proc apart

20       continue
         mypi = h*sum
         mypi2 = h*sum2

! collect all the partial sums
         call MPI_REDUCE(mypi,pi,1,MPI_DOUBLE_PRECISION,MPI_SUM &
                          ,0,MPI_COMM_WORLD,ierr)
          call MPI_REDUCE(mypi2,pi2,1,MPI_DOUBLE_PRECISION,MPI_SUM &
                                           ,0,MPI_COMM_WORLD,ierr)

          if (myid .eq. 0) then
            write(*,*) 'pi from Gropp is ', pi,' Error is ',abs(pi-PI25DT)
            write(*,*) 'pi from HW is ', pi2,' Error is ',abs(pi-PI25DT)
          end if
!         goto 10
30        call MPI_FINALIZE(ierr)
          stop
        end program
