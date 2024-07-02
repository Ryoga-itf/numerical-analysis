using Plots
using LinearAlgebra

A = calcA(temp, 2)
Q0, R = qr(A)
Q = Matrix(Q0)
c = inv(R) * Q' * resistivity

function f(x)
    return c[2] * x + c[1]
end

plot(temp, resistivity, markershape=:x, la=0.0)
plot!(f)
