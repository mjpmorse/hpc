       subroutine mandelbrot(xleft,xright,ybottom,ytop,rank,datafile, &
                             gridsize,area)
         implicit none
         integer, parameter :: dp = selected_real_kind(15,307)
! define the box we are working in
         real(kind=dp) :: xleft,xright,ybottom,ytop
         real(kind=dp) :: area
         logical :: inset
! defines the grid
         integer :: gridsize,xstep,ystep
         real(kind=dp) :: deltax,deltay,x,y,dxdy
         integer :: incount,allcount
         integer :: iteration,rank
         character(len = 32) :: datafile,stringrank
         integer, dimension(gridsize,gridsize) :: figure
! set up the steps
         deltax = (xright - xleft)/(real(gridsize,dp))
         deltay = (ytop - ybottom)/(real(gridsize,dp))
         area = 0d0
         x = xleft + deltax/2d0
         y = ybottom + deltay/2d0
         dxdy = deltax*deltay
         allcount = 0
         incount = 0
         write(stringrank,*) rank
         stringrank = adjustl(stringrank)

         open(unit = 1, file = trim(datafile)//trim(stringrank)//'.dat')

         do xstep = 1,gridsize,1
           do ystep = 1,gridsize,1
             call in_set(x,y,inset)
             allcount = allcount + 1
!In the mandelbrot set
             if(inset) then
               figure(xstep,ystep) = 0
               area = area +dxdy
             else
               figure(xstep,ystep) = 255
             end if
             y = ybottom + real((ystep-1),dp)*deltay
           end do
           x = xleft+real((xstep-1),dp)*deltax
         end do
         !Plot mandelbrot set in complex plane
         open  (10, file = 'output.pgm')
         write (10, '(a/ i0, 1x, i0/ i0)') 'P2', gridsize, gridsize, 255
         write (10, '(i0)') figure
         close (10)

       end subroutine

        subroutine in_set(creal,ci,inset)
          implicit none
          integer, parameter :: dp = selected_real_kind(15,307)
          integer :: iteration
          real(kind = dp) :: zreal,zi,zabs,creal,ci
          logical inset
          inset = .false.
          zreal = creal
          zi = ci
          zabs = 0d0
          do iteration = 1,100000,1
            call cabs(zreal,zi,zabs)
            if(zabs .gt. 4d0) then
              inset = .false.
              goto 10
            end if
! z_(n+1) = z_n^2 + c -->
!z_real_(n+1) = (zreal_n^2 - zi_n^2) + creal
!z_i_(n+1) = 2(zreal_n)(zi_n) + ci
            zreal = (zreal*zreal - zi*zi ) + creal
            zi = 2d0 * zreal * zi + ci
          end do
          if (zabs .le. 4) then
              inset =  .true.
          endif
10        continue
        end subroutine

        subroutine cabs(x,y,abs)
          implicit none
          integer, parameter :: dp = selected_real_kind(15,307)
          real(kind = dp) :: x,y,abs
          abs = (x*x+y*y)
        end subroutine
