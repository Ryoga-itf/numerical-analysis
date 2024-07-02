function p(z::ComplexF64)::ComplexF64
    return z^3.0 - 1.0
end

function p_derivative(z::ComplexF64)::ComplexF64
    return 3.0 * z^2.0
end

function newtonMethod_p(initial::ComplexF64)::ComplexF64
    z = initial
    while true
        z = z - (p(z) / p_derivative(z))
        if abs(p(z)) < 1e-5
            return z
        end
    end
end
