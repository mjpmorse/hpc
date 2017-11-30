        program problem3a
          use mpi
          implicit none
          integer, parameter :: dp = selected_real_kind(15,307)
          real(kind = dp) :: xmin,xmax,ymin,ymax
          real(kind = dp),dimension(2) :: finalarea,area
          real(kind = dp) :: xranklow,xrankhigh,dx
          integer ::gridsize
          character(len = 1024) :: datafile
          integer :: error, rank, size

! Initiate MPI
         call MPI_INIT(error)
         call MPI_COMM_SET_ERRHANDLER(MPI_COMM_WORLD, &
                                      MPI_ERRORS_RETURN,error)
         call MPI_COMM_RANK(MPI_COMM_WORLD,rank,error)
         call ERROR_CHECK(error)
         call MPI_COMM_SIZE(MPI_COMM_WORLD,size,error)
         call ERROR_CHECK(error)

         call GET_COMMAND_ARGUMENT(1,datafile)
         area(:) = 0d0
         finalarea(:)=0d0

! we will actual vertically strip the grid as if we want to box it
! and take into account proper dimentions we need a 2:1 processor
! ratio for horizontal vs vertical which means mod(size,3) = 0

          xmin = -2d0
          xmax = 2d0
          ymin = -1d0
          ymax = 1d0
          dx = (xmax-xmin)/real(size,dp)
          xranklow = xmin + dx*real(rank-1,dp)
          xrankhigh = xmin + dx*real(rank,dp)


!          call GET_COMMAND_ARGUMENT(2,gridsize)
          gridsize = 1000
          call mandelbrot(xranklow,xrankhigh,ymin,ymax,rank,datafile, &
                                gridsize,area)

          call MPI_REDUCE(area,finalarea,2,MPI_DOUBLE_PRECISION,&
                           MPI_SUM ,0,MPI_COMM_WORLD,ierr)

          if(rank .eq. 0) then

          write(*,*) 'the area is ', area
        end program
