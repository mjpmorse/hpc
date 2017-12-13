       program ppi
         use mpi
         implicit none
         double precision PI25DT
         parameter (PI25DT = 3.141592653589793238462643d0)
         double precision h,sum1,x,f,g,a,sum2
         double precision mypi(2),pi(2),stime,etime,time
         integer n,myid,size,i,ierr
         character(len =2) :: proc

! function to integrate
         f(a) = 4.0d0/(1.0d0+a*a)
         g(a) = 4*(1-a*a)**(0.5)

         call GET_COMMAND_ARGUMENT(1,proc)

         call MPI_INIT(ierr)
         call MPI_COMM_RANK(MPI_COMM_WORLD,myid,ierr)
         call MPI_COMM_SIZE(MPI_COMM_WORLD,size,ierr)

10       if (myid .eq. 0) then
!           write(*,*) 'Enter number of intervals: (0 quits) '
!           read(*,*)   n
            n = 1d6*dble(size)
            stime = MPI_WTIME()
!            write(*,*) 'n is :', n
         end if
!         n = 1d5

         call MPI_BCAST(n,1,MPI_INTEGER,0,MPI_COMM_WORLD,ierr)

         if (n .le. 0) goto 30

         h = 1.0d0/n
         sum1 = 0.0d0
         sum2 = 0.0d0
         do 20 i = myid +1,n,size
           x = h * (dble(i) - 0.5d0)
           sum1 = sum1 +f(x)
           sum2 = sum2 + g(x)
           ! rectangles are number of proc apart

20       continue
         mypi(1) = h*sum1
         mypi(2) = h*sum2

! collect all the partial sums
          call MPI_REDUCE(mypi,pi,2,MPI_DOUBLE_PRECISION,MPI_SUM &
                          ,0,MPI_COMM_WORLD,ierr)
!         call MPI_REDUCE(mypi(2,pi2,1,MPI_DOUBLE_PRECISION,MPI_SUM &
!                                           ,0,MPI_COMM_WORLD,ierr)

          if (myid .eq. 0) then
             etime = MPI_WTIME()
             time = etime-stime
!            write(*,*) 'pi from Gropp is ', pi(1),' Error is ',abs(pi(1)-PI25DT)
!            write(*,*) 'pi from HW is ', pi(2),' Error is ',abs(pi(2)-PI25DT)
             write(*,"(A2,A1,F10.6)") proc,",",time

          end if
!         goto 10
30        call MPI_FINALIZE(ierr)
        end program
