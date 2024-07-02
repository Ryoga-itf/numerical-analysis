using LinearAlgebra

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

function calcLyB(l::Matrix{Float64}, b::Vector{Float64})::Vector{Float64}
    result::Vector{Float64} = zeros(Float64, 0)
    (row, col) = size(l)
    term::Float64 = 0.0
    
    x::Float64 = b[1] / l[1, 1]
    push!(result, x)
    for i = 2:row
        term = 0.0
        for j = 1:(i - 1)
            term = term + l[i, j] / l[i, i] * result[j]
        end
        x = b[i] / l[i, i] - term
        push!(result, x)
    end
    return result
end

function calcUxy(u::Matrix{Float64}, y::Vector{Float64})::Vector{Float64}
    result::Vector{Float64} = zeros(Float64, 0)
    (row, col) = size(u)
    term::Float64 = 0.0
    
    x::Float64 = y[row] / u[row, col]
    pushfirst!(result, x)
    for i = 2:row
        term = 0.0
        index::Int64 = 1
        for j = (row - i + 2):row
            term = term + (u[row - i + 1, j] / u[row - i + 1, col - i + 1]) * result[index]
            index = index + 1
        end
        x = y[row - i + 1] / u[row - i + 1, col - i + 1] - term
        pushfirst!(result, x)
    end
    return result
end

A::Matrix{Float64} = [
    4 3 2 1;
    3 4 3 2;
    2 3 4 3;
    1 2 3 4;
]

B::Vector{Float64} = [
    1.0;
    1.0;
    1.0;
    1.0;
]

# (3.1)
L, U = makeLU(A)

y = calcLyB(L, B)
x = calcUxy(U, y)
println("ans: ", x)

# (3.2)
error = B - A * x
println("error: ", error)
