module equations_generator
    use setup
contains
    subroutine generate_coeffitients(n, coef_matrix)
        implicit none
        integer, intent(in) :: n
        real (kind = iPRECISION), dimension(n - 1, n -1), intent(out) :: coef_matrix
        integer :: i
        real (kind = iPRECISION) :: c1, c2

        ! Calculate coefficients
        c1 = real(n, kind = iPRECISION) ** 2
        c2 = -2.0 * c1


        coef_matrix(:, :) = real(0, kind = iPRECISION)

        coef_matrix(1, 1) = c2
        coef_matrix(1, 2) = c1

        do i = 2, (n - 2)
            coef_matrix(i - 1, i) = c1
            coef_matrix(i , i) = c2
            coef_matrix(i + 1, i) = c1
        end do

        coef_matrix(n - 1, n - 1) = real(1, kind = iPRECISION)

    end subroutine generate_coeffitients

    subroutine generate_values(n, val_matrix)
        integer, intent(in) :: n
        real (kind = iPRECISION), dimension(n - 1), intent(out) :: val_matrix

        val_matrix(:) = 0
        val_matrix(n - 1) = 1

    end subroutine generate_values
end module equations_generator