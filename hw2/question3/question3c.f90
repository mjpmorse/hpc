       program question3b
         use mpi
         implicit none
         integer, parameter :: dp = selected_real_kind(15,307)
! define the box we are working in
         real(kind=dp) :: xleft,xright,ybottom,ytop
         real(kind=dp) :: area
         logical :: inset
! defines the grid
         integer :: gridsize,xstep,ystep
         real(kind=dp) :: deltax,deltay,x,y,dxdy
         real(kind=dp) :: xgiven,ygiven
         integer :: incount,allcount
         integer :: iteration,rank
         character(len = 32) :: datafile,stringrank
! set up the steps
         integer :: error, rank, size
         logical : inset

! Initiate MPI
         call MPI_INIT(error)
         call MPI_COMM_SET_ERRHANDLER(MPI_COMM_WORLD, &
                                      MPI_ERRORS_RETURN,error)
         call MPI_COMM_RANK(MPI_COMM_WORLD,rank,error)
         call ERROR_CHECK(error)
         call MPI_COMM_SIZE(MPI_COMM_WORLD,size,error)
         call ERROR_CHECK(error)

         call GET_COMMAND_ARGUMENT(1,datafile)
         deltax = (xright - xleft)/(real(gridsize,dp))
         deltay = (ytop - ybottom)/(real(gridsize,dp))
         dxdy = deltax*deltay
! set up rank 0 as the central hub
         write(stringrank,*) rank
         stringrank = adjustl(stringrank)

         open(unit = 1, file = trim(datafile)//trim(stringrank)//'.dat')

         if(rank.eq.0) then
           do xstep = 1,gridsize,1
             do ystep = 1,gridsize,1
               
               y = ybottom + real((ystep-1),dp)*deltay
             end do
             x = xleft+real((xstep-1),dp)*deltax
           end do
         end if

20       continue
         if(rank.ne.0) then

         call in_set(xgiven,ygiven,inset)
         if(inset) then
         area = area+dxdy
         write(1,*) xgive,"," ,ygiven
         goto 20
         end if

         area(1) = area(1)*real(incount,dp)/real(allcount,dp)
       end program

