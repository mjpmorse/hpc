        program problem3a
          implicit none
          integer, parameter :: dp = selected_real_kind(15,307)
          real(kind = dp) :: xmin,xmax,ymin,ymax,area
          integer ::gridsize
          character(len = 1024) :: datafile

          xmin = -2d0
          xmax = 2d0
          ymin = -1d0
          ymax = 1d0
          call GET_COMMAND_ARGUMENT(1,datafile)
!          call GET_COMMAND_ARGUMENT(2,gridsize)
          gridsize = 10000
          call mandelbrot(xmin,xmax,ymin,ymax,0,datafile, &
                                gridsize,area)
          write(*,*) 'the area is ', area
        end program
