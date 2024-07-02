include("./4-1.jl")
include("./4-2.jl")
include("./4-3.jl")

using Plots

function relativeError(actual, approximation)
    return abs(actual - approximation) / actual
end

function plotMyExpError(n, x)
    plt = plot(
        x,
        relativeError.(exp.(x), myexp.(n, x)),
        yaxis=:log,
        ylim=[10^(-20), 1.0],
        label = "myexp"
    )
    plot!(
        plt,
        x,
        relativeError.(exp.(x), myexp2.(n, x)),
        yaxis=:log,
        ylim=[10^(-20), 1.0],
        label = "myexp2"
    )
    plot!(
        plt,
        x,
        relativeError.(exp.(x), myexp3.(200, x)),
        yaxis=:log,
        ylim=[10^(-20), 1.0],
        label = "myexp3"
    )
    return plt
end

plot(
    plotMyExpError(200, range(-50, 50)),
    plotMyExpError(1000, range(-50, 50)),
    plotMyExpError(200, range(-500, 500)),
    plotMyExpError(1000, range(-500, 500))
)
