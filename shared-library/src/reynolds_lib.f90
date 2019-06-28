
module reynolds_lib

    use iso_fortran_env, only : real32, real64

    implicit none

    private
    public reynolds

    interface reynolds
        module procedure :: reynolds32_rho_v_l_mu
        module procedure :: reynolds64_rho_v_l_mu
        module procedure :: reynolds32_v_l_nu
        module procedure :: reynolds64_v_l_nu
    end interface reynolds

contains

    elemental pure function reynolds32_rho_v_l_mu( &
        rho, v, l, mu ) result(re)
        real(real32),intent(in) :: rho, v, l, mu
        real(real32)            :: re
        re = rho * v * l / mu
    end function reynolds32_rho_v_l_mu

    elemental pure function reynolds64_rho_v_l_mu( &
        rho, v, l, mu ) result(re)
        real(real64),intent(in) :: rho, v, l, mu
        real(real64)            :: re
        re = rho * v * l / mu
    end function reynolds64_rho_v_l_mu

    elemental pure function reynolds32_v_l_nu( &
        v, l, nu ) result(re)
        real(real32),intent(in) :: v, l, nu
        real(real32)            :: re
        re = v * l / nu
    end function reynolds32_v_l_nu

    elemental pure function reynolds64_v_l_nu( &
        v, l, nu ) result(re)
        real(real64),intent(in) :: v, l, nu
        real(real64)            :: re
        re = v * l / nu
    end function reynolds64_v_l_nu

end module reynolds_lib
