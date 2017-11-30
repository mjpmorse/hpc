        program problem3a
          implicit none
          integer, parameter :: dp = selected_real_kind(15,307)
          real(kind = dp) :: xmin,xmax,ymin,ymax
          real(kind=dp):: area
          integer ::gridsize
          character(len = 1024) :: datafile

          xmin = -2d0
          xmax = 2d0
          ymin = -1d0
          ymax = 1d0

          open(unit = 10, file ='area_3a.txt')
!          call GET_COMMAND_ARGUMENT(1,datafile)
          datafile = 'DISREGARD'
!          call GET_COMMAND_ARGUMENT(2,gridsize)
          do gridsize = 50,2000,100
          call mandelbrot(xmin,xmax,ymin,ymax,0,datafile, &
                                gridsize,area)
          write(10,*) area,real(gridsize,dp)
          end do
          close(10)
        end program
