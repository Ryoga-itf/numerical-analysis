using LinearAlgebra

function Pij(i, j, alpha, n)
    In = Matrix{Float64}(I, n, n)  # n次元の単位行列の作成
    P  = In + alpha * In[:, i]*In[:, j]'
    return P
end

function LUdecomposition(A::Matrix{Float64})::NamedTuple{(:L, :U), Tuple{Matrix{Float64}, Matrix{Float64}}}
    a = deepcopy(A)
    (row, col) = size(a)
    m::Matrix{Float64} = Matrix{Float64}(I, row, col)
    for j = 1:(col - 1)
        current_m::Matrix{Float64} = Matrix{Float64}(I, row, col)
        for i = (j + 1):row
            current_m = Pij(i, j, -a[i, j] / a[j, j], row) * current_m
        end
        a = current_m * a
        m = current_m * m
    end
    return (L = inv(m), U = a)
end

A::Matrix{Float64} = [
    4 3 2 1;
    3 4 3 2;
    2 3 4 3;
    1 2 3 4;
]

L, U = LUdecomposition(A)
println("L: ", L)
println("U: ", U)
