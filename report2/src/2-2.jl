using Plots

temp = [-195, 0, 20, 100, 200, 300, 497, 700, 977]
resistivity = [0.2, 1.55, 1.694, 2.33, 2.93, 3.6, 4.6, 6.7, 8.1]

plot(temp, resistivity, markershape=:x, la=0.0)
