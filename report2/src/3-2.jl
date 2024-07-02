using Plots

function mysin(n, x)
    xn = x
    P  = x
    k  = ceil(n / 2) - 1
    for i = 1:k
        r  = ((-1) / ( (2*i) * (2*i + 1))) * x^2
        xn = xn * r
        P  = P + xn
    end
    return P
end

x = range(0, pi, 100)
plot(x, mysin.(1, x), label = "n = 1")
plot!(x, mysin.(3, x), label = "n = 3")
plot!(x, mysin.(5, x), label = "n = 5")
plot!(x, mysin.(7, x), label = "n = 7")
