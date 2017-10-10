      program problem3
        implicit none
        real, DIMENSION(:,:),ALLOCATABLE :: m1
        real, DIMENSION(:,:),ALLOCATABLE :: m2
        real, DIMENSION(:,:),ALLOCATABLE :: m3
        integer n
        integer i,j
        real random1
        real random2
        real seed
        real start1,start2
        real stop1,stop2
        character(len = 32) dataFile

        call RANDOM_SEED()
        CALL GET_COMMAND_ARGUMENT(1,dataFile)
        open(unit=1,file=dataFile)
        write(1,*) "Matrix Size, ",'First Index Sum 1rst, ',&
     &                           'Second Index Sum 1rst'

        do n = 100,10000,100
          ALLOCATE(m1 (n,n))
          ALLOCATE(m2 (n,n))
          ALLOCATE(m3 (n,n))
          do i = 1, n ,1
            do j = 1 , n,1
              call RANDOM_NUMBER(random1)
              call RANDOM_NUMBER(random2)
              m1(i,j) = random1
              m1(j,i) = random2
            end do
          end do
!(row x column)
!Sum over first index first (rows)
          call cpu_time(start1)
          do i = 1, n , 1
            do j = 1,n,1
              m3(j,i) = m1(j,i) + m2(j,i)
            end do
          end do
          call cpu_time(stop1)
!Sum over second index first (columns)

          call cpu_time(start2)
          do i = 1, n , 1
            do j = 1,n,1
              m3(i,j) = m1(i,j) + m2(i,j)
            end do
          end do
          call cpu_time(stop2)

          write(1,*) n,',',stop1-start1,',',stop2-start2
          DEALLOCATE(m1)
          DEALLOCATE(m2)
          DEALLOCATE(m3)
        end do
        close(1)
      end program
