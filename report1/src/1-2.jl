include("./1-1.jl")
using Plots

function DiffPi(x)
    return abs(x - pi)
end

x = [10^1, 10^2, 10^3, 10^4, 10^5, 10^6]
y = DiffPi.(MonteCarlo.(x))
plot(
    x,
    y,
    xaxis=:log,
    yaxis=:log,
    xlabel = "n",
    ylabel = "diff",
    label = "diff"
)
