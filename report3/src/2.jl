using LinearAlgebra

A::Matrix{Float64} = [
    4 3 2 1;
    3 4 3 2;
    2 3 4 3;
    1 2 3 4;
]


# (2.1)
function task1(A::Matrix{Float64})::Matrix{Float64}
    a = deepcopy(A)
    a[2, :] = a[2, :] + (-3 / 4) * a[1, :]
    return a
end

println("(2.1): ", task1(A))

# (2.2)
function makeU(A::Matrix{Float64})::Matrix{Float64}
    a = deepcopy(A)
    (row, col) = size(a)
    for j = 1:(col - 1)
        for i = (j + 1):row
            a[i, :] = a[i, :] + (-a[i, j] / a[j, j]) * a[j, :]
        end
    end
    return a
end

println("(2.2): ", makeU(A))

# (2.3)
function makeLU(A::Matrix{Float64})::NamedTuple{(:L, :U), Tuple{Matrix{Float64}, Matrix{Float64}}}
    a = deepcopy(A)
    (row, col) = size(a)
    l::Matrix{Float64} = Matrix{Float64}(I, row, col)
    for j = 1:(col - 1)
        for i = (j + 1):row
            alpha = -a[i, j] / a[j, j]
            a[i, :] = a[i, :] + alpha * a[j, :]
            l[:, j] = l[:, j] -1.0 * alpha * l[:, i]
        end
    end
    return (L = l, U = a)
end

println("(2.3)")
L, U = makeLU(A)
println("  L: ", L)
println("  U: ", U)
