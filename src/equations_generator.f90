! Created by ajopek on 21.04.18.

module equations_generator
    implicit none
contains
    subroutine generate_coeffitients(n, coef_matrix)
        implicit none
        integer, intent(in) :: n
        real (kind = 4), dimension(n - 1, 3), intent(out) :: coef_matrix
        real (kind = 4) :: h
        integer :: i, j
        real (kind = 4) :: c1, c2, c3

        ! Calculate points distance
        h =  1. / n;

        ! Calculate coefficients
        c1 = 1. / (h**2)
        c2 = -2. / (h**2)
        c3 = c1

        coef_matrix(:, :) = 0

        coef_matrix(1, 3) = c1
        coef_matrix(1, 2) = c2

        do i = 2, (n - 2)
            coef_matrix(i, 1) = c3
            coef_matrix(i, 2) = c2
            coef_matrix(i, 3) = c1
        end do

        coef_matrix(n - 1, 2) = c2
        coef_matrix(n - 1, 1) = c3


    end subroutine generate_coeffitients

    subroutine generate_values(n, val_matrix)
        integer, intent(in) :: n
        real (kind = 4), dimension(n - 1), intent(out) :: val_matrix

        val_matrix(:) = 0
        val_matrix(n-1) = -1. / (1. / n)**2

    end subroutine generate_values
end module equations_generator