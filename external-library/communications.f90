module communications
    use mpi
    !$ use omp_lib

    implicit none

    private
    public :: communicate

    integer,parameter :: size_per_process = 10

contains

    subroutine communicate(nprocs, myrank, ierr)
        integer,intent(in) :: nprocs, myrank
        integer,intent(out) :: ierr

        integer :: data(size_per_process)
        !$ integer :: i

        data(:) = myrank * size(data)

        !$omp parallel do
        !$ do i = 1, size(data)
        !$     data(i) = data(i) + omp_get_thread_num()
        !$ end do
        !$omp end parallel do

        call gather(data, ierr)
        if (ierr /= MPI_SUCCESS) return

    contains

        subroutine gather(data, ierr)
            use iso_fortran_env, only : output_unit

            integer,intent(in)  :: data(:)
            integer,intent(out) :: ierr

            integer,parameter :: root_rank = 0
            integer,allocatable :: gathered_data(:)
            integer :: i

            if (myrank == root_rank) then
                allocate( gathered_data( size(data) * nprocs ) )
            end if

            call MPI_Gather( &
                data         , size(data), MPI_INTEGER, &
                gathered_data, size(data), MPI_INTEGER, &
                root_rank, MPI_COMM_WORLD, ierr &
                )
            if (ierr /= MPI_SUCCESS) return

            if (myrank == root_rank) then
                do i = 1, size(gathered_data)
                    write (output_unit, "(A, I6, 1X, A, I6)") &
                        "process ",     gathered_data(i) / size(data), &
                        "thread  ", mod(gathered_data(i) , size(data))
                end do
            end if
        end subroutine gather

    end subroutine communicate

end module communications
