
module reynolds_c_interface

    use iso_c_binding, only : c_size_t, c_float, c_double
    use reynolds_lib

    implicit none

    private

contains

    !> # float  ρVL/μ
    function reynolds_f_rhoVLmu(rho, v, l, mu) result(re) &
        bind(C, name = "reynolds_f_rhoVLmu")
        real(c_float),value :: rho, v, l, mu
        real(c_float)       :: re
        re = reynolds(rho=rho, v=v, l=l, mu=mu)
    end function reynolds_f_rhoVLmu

    subroutine reynolds_vf_rhoVLmu(size_, re, rho, v, l, mu) &
        bind(C, name = "reynolds_vf_rhoVLmu")
        integer(c_size_t),value :: size_
        real(c_float),dimension(size_),intent(out) :: re
        real(c_float),dimension(size_),intent(in)  :: rho, v, l, mu
        re(:) = reynolds(rho=rho(:), v=v(:), l=l(:), mu=mu(:))
    end subroutine reynolds_vf_rhoVLmu

    !> # double ρVL/μ
    function reynolds_l_rhoVLmu(rho, v, l, mu) result(re) &
        bind(C, name = "reynolds_l_rhoVLmu")
        real(c_double),value :: rho, v, l, mu
        real(c_double)       :: re
        re = reynolds(rho=rho, v=v, l=l, mu=mu)
    end function reynolds_l_rhoVLmu

    subroutine reynolds_vl_rhoVLmu(size_, re, rho, v, l, mu) &
        bind(C, name = "reynolds_vl_rhoVLmu")
        integer(c_size_t),value :: size_
        real(c_double),dimension(size_),intent(out) :: re
        real(c_double),dimension(size_),intent(in)  :: rho, v, l, mu
        re(:) = reynolds(rho=rho(:), v=v(:), l=l(:), mu=mu(:))
    end subroutine reynolds_vl_rhoVLmu

    !> # float  VL/ν
    function reynolds_f_VLnu(v, l, nu) result(re) &
        bind(C, name = "reynolds_f_VLnu")
        real(c_float),value :: v, l, nu
        real(c_float)       :: re
        re = reynolds(v=v, l=l, nu=nu)
    end function reynolds_f_VLnu

    subroutine reynolds_vf_VLnu(size_, re, v, l, nu) &
        bind(C, name = "reynolds_vf_VLnu")
        integer(c_size_t),value :: size_
        real(c_float),dimension(size_),intent(out) :: re
        real(c_float),dimension(size_),intent(in)  :: v, l, nu
        re(:) = reynolds(v=v(:), l=l(:), nu=nu(:))
    end subroutine reynolds_vf_VLnu

    !> # double VL/ν
    function reynolds_l_VLnu(v, l, nu) result(re) &
        bind(C, name = "reynolds_l_VLnu")
        real(c_double),value :: v, l, nu
        real(c_double)       :: re
        re = reynolds(v=v, l=l, nu=nu)
    end function reynolds_l_VLnu

    subroutine reynolds_vl_VLnu(size_, re, v, l, nu) &
        bind(C, name = "reynolds_vl_VLnu")
        integer(c_size_t),value :: size_
        real(c_double),dimension(size_),intent(out) :: re
        real(c_double),dimension(size_),intent(in)  :: v, l, nu
        re(:) = reynolds(v=v(:), l=l(:), nu=nu(:))
    end subroutine reynolds_vl_VLnu

end module reynolds_c_interface
