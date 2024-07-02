using Plots
using Polynomials

function p(z::ComplexF64)::ComplexF64
    return z^3.0 - 1.0
end

function p_derivative(z::ComplexF64)::ComplexF64
    return 3.0 * z^2.0
end

function newtonMethod_p_withPlotAbs(initial::ComplexF64)
    z = initial
    diffs = [abs(p(initial))]
    while true
        z_tmp = z
        z = z - (p(z) / p_derivative(z))
        current = abs(p(z))
        push!(diffs, current)
        if current < 1e-5
            break
        end
    end

    plot(
        0:length(diffs) - 1,
        diffs,
        label = "z_k",
        xlabel = "attempts",
        ylabel = "|p(z_k)|",
        yaxis=:log,
    )
end

newtonMethod_p_withPlotAbs(2.0 + 2.0im)
