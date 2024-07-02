using Plots

function absoluteError(actual, approximation)
    return abs(actual - approximation) / actual
end

x = range(1, 14)
plot(
    x,
    absoluteError.(sin.(pi / 4), mysin.(x, pi / 4)),
    yaxis=:log,
    xlabel = "n",
    label = "absolute error"
)
