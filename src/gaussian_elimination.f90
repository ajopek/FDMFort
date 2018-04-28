module gaussian_elimination
    use setup
contains
    subroutine apply_elimination(coef_matrix, val_matrix, matrix_dim)
        implicit none
        integer, intent(in) :: matrix_dim
        real (kind = iPRECISION), dimension(matrix_dim, matrix_dim) :: coef_matrix
        real (kind = iPRECISION), dimension(matrix_dim) :: val_matrix

        integer :: i, j
        real (kind = iPRECISION) :: multiplier
        do i = 1, matrix_dim
            do j = 1, matrix_dim
                if (i .NE. j) then
                    multiplier = coef_matrix(i, j) / coef_matrix(i, i)
                    coef_matrix(:, j) = coef_matrix(:, j) - multiplier * coef_matrix(:, i)
                    val_matrix(j) = val_matrix(j) - multiplier * val_matrix(i)
                end if
                val_matrix(i) = val_matrix(i) / coef_matrix(i, i)
                coef_matrix(:, i) = coef_matrix(:, i) / coef_matrix(i, i)
            end do
        end do

    end subroutine apply_elimination
end module gaussian_elimination