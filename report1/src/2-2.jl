using Polynomials

function SolveByBetterFormula(c, b, a)
    alpha = (-b - sign(b) * sqrt(b^2 - 4 * a * c)) / (2 * a)
    beta = c / (a * alpha)
    return [min(alpha, beta), max(alpha, beta)]
end

c = [1, -124, 1]
p = Polynomial(c)
x_actual = roots(p)

x = SolveByBetterFormula(1, -124, 1)

diff_abs = abs(x[1] - x_actual[1]), abs(x[2] - x_actual[2])

println(x_actual)
println(x)

println("残差: ", c[1] + c[2] * x[1] + c[3] * x[1]^2, ", ", c[1] + c[2] * x[2] + c[3] * x[2]^2)
println("絶対誤差: ", diff_abs[1], ", ", diff_abs[2])
println("相対誤差: ", diff_abs[1] / abs(x_actual[1]), ", ", diff_abs[2] / abs(x_actual[2]))
