using Plots
using Polynomials

function f(x)
    return 1 / (25*x^2 + 5*x + 2)
end

x_points = range(-1.0, 1.0, 10)
x_result = Polynomials.fit(x_points, f.(x_points));

cos_points = cos.(range(0, pi, 10))
cos_result = Polynomials.fit(cos_points, f.(cos_points));

println("normal: ", x_result);
println("cos   : ", cos_result);

plt1 = plot(f, xlim=[-1.0, 1.0], label = "actual")
plot!(plt1, x_points, f.(x_points), label = "points", seriestype=:scatter)
plot!(plt1, x_result, xlim=[-1.0, 1.0], label = "normal")

plt2 = plot(f, xlim=[-1.0, 1.0], label = "actual")
plot!(plt2, cos_points, f.(cos_points), label = "points", seriestype=:scatter)
plot!(plt2, cos_result, xlim=[-1.0, 1.0], label = "cos")

plot(plt1, plt2)
