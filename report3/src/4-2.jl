using Plots
using Polynomials

function p(z::ComplexF64)::ComplexF64
    return z^3.0 - 1.0
end

function p_derivative(z::ComplexF64)::ComplexF64
    return 3.0 * z^2.0
end

function newtonMethod_p_withPlot(initial::ComplexF64)
    z = initial
    re = [real(z)]
    im = [imag(z)]
    while true
        z = z - (p(z) / p_derivative(z))
        push!(re, real(z))
        push!(im, imag(z))
        if abs(p(z)) < 1e-5
            break
        end
    end

    actual = roots(Polynomial([-1, 0, 0, 1]))
    
    plot(
        re,
        im,
        markershape=:x,
        series_annotations = text.(0:length(re)-1, :bottom, 6),
        label = "z_k",
        xlabel = "Real",
        ylabel = "Imag"
    )
    plot!([real(initial)], [imag(initial)], label = "initial value", seriestype=:scatter)
    plot!([real(actual)], [imag(actual)], label = "actual value", seriestype=:scatter)
end

newtonMethod_p_withPlot(2.0 + 2.0im)
