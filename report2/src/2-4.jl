include("./2-3.jl")

println("400 度における低効率：", f(400), "[10^-8 Ωm]")
println("抵抗率が 2.00 [10^-8 Ωm] となるときの温度：", (2.00 - c[1]) / c[2], "[℃]")