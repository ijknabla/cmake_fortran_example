program test1

    use iso_fortran_env, only : error_unit

    use reynolds_lib

    implicit none

    interface assert
        procedure :: assert_scalar
        procedure :: assert_1darray
    end interface assert

    call assert( reynolds(rho=2.  , v=1.  , l=1.  , mu=1.  ) == 2.   )
    call assert( reynolds(rho=1.  , v=2.  , l=1.  , mu=1.  ) == 2.   )
    call assert( reynolds(rho=1.  , v=1.  , l=2.  , mu=1.  ) == 2.   )
    call assert( reynolds(rho=1.  , v=1.  , l=1.  , mu=.5  ) == 2.   )

    call assert( reynolds(rho=2.d0, v=1.d0, l=1.d0, mu=1.d0) == 2.d0 )
    call assert( reynolds(rho=1.d0, v=2.d0, l=1.d0, mu=1.d0) == 2.d0 )
    call assert( reynolds(rho=1.d0, v=1.d0, l=2.d0, mu=1.d0) == 2.d0 )
    call assert( reynolds(rho=1.d0, v=1.d0, l=1.d0, mu=.5d0) == 2.d0 )

    call assert( reynolds(v=2.  , l=1.  , nu=1.  ) == 2.   )
    call assert( reynolds(v=1.  , l=2.  , nu=1.  ) == 2.   )
    call assert( reynolds(v=1.  , l=1.  , nu=.5  ) == 2.   )

    call assert( reynolds(v=2.d0, l=1.d0, nu=1.d0) == 2.d0 )
    call assert( reynolds(v=1.d0, l=2.d0, nu=1.d0) == 2.d0 )
    call assert( reynolds(v=1.d0, l=1.d0, nu=.5d0) == 2.d0 )


    call assert( reynolds(rho=(/2.  , 2.  /), v=1.  , l=1.  , mu=1.  ) == 2.  )
    call assert( reynolds(rho=(/1.  , 1.  /), v=2.  , l=1.  , mu=1.  ) == 2.  )
    call assert( reynolds(rho=(/1.  , 1.  /), v=1.  , l=2.  , mu=1.  ) == 2.  )
    call assert( reynolds(rho=(/1.  , 1.  /), v=1.  , l=1.  , mu=.5  ) == 2.  )

    call assert( reynolds(rho=(/2.d0, 2.d0/), v=1.d0, l=1.d0, mu=1.d0) == 2.d0)
    call assert( reynolds(rho=(/1.d0, 1.d0/), v=2.d0, l=1.d0, mu=1.d0) == 2.d0)
    call assert( reynolds(rho=(/1.d0, 1.d0/), v=1.d0, l=2.d0, mu=1.d0) == 2.d0)
    call assert( reynolds(rho=(/1.d0, 1.d0/), v=1.d0, l=1.d0, mu=.5d0) == 2.d0)

contains

    subroutine assert_scalar( test )
        logical,intent(in) :: test
        if (.not. test) then
            write(error_unit, *) "Assertion Violated"
            stop 1
        end if
    end subroutine assert_scalar

    subroutine assert_1darray( test )
        logical,intent(in) :: test(:)
        call assert( all( test(:) ) )
    end subroutine assert_1darray

end program test1
