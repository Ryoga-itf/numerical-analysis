function myexp3(n, x)
    x_integer = floor(x)
    x_decimal = x - x_integer
    return ℯ^x_integer * myexp2(n, x_decimal)
end
