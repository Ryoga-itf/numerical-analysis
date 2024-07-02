function myexp(n, x)
    xn = 1
    P = xn
    for i = 1:n
        xn = xn * x / i
        P = P + xn
    end
    return P
end
