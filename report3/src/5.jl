using Plots
using Polynomials

function p(z::ComplexF64)::ComplexF64
    return z^3.0 - 1.0
end

function p_derivative(z::ComplexF64)::ComplexF64
    return 3.0 * z^2.0
end

function newtonMethod_p(initial::ComplexF64)
    z = initial
    while true
        z = z - (p(z) / p_derivative(z))
        if abs(p(z)) < 1e-5
            break
        end
    end
    return z
end

function findClosestIndex(z::ComplexF64, actual::Vector{ComplexF64})
    result = 1
    min_diff = abs(actual[1] - z)
    for i = 2:length(actual)
        diff = abs(actual[i] - z)
        if min_diff > diff
            min_diff = diff
            result = i
        end
    end
    return result
end

# (5.1)
println("(5.1): ", findClosestIndex(newtonMethod_p(2.0 + 2.0im), roots(Polynomial([-1, 0, 0, 1]))))

# (5.2)
function plotClosestIndex(m::Int64)
    actual = roots(Polynomial([-1, 0, 0, 1]))
    px::Vector{Vector{Float64}} = [[], [], []]
    py::Vector{Vector{Float64}} = [[], [], []]
    for x = range(-4, 4, m)
        for y = range(-5, 5, m)
            z = newtonMethod_p(complex(x, y))
            index = findClosestIndex(z, actual)
            push!(px[index], x)
            push!(py[index], y)
        end
    end
    scatter(px[1], py[1], markerstrokewidth=0, mc=:red, ms=1, legend=false)
    scatter!(px[2], py[2], markerstrokewidth=0, mc=:green, ms=1, legend=false)
    scatter!(px[3], py[3], markerstrokewidth=0, mc=:blue, ms=1, legend=false)
    savefig("fig3.png")
end

plotClosestIndex(300)
