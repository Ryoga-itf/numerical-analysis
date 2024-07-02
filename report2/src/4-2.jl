function myexp2(n, x)
    if x >= 0
        return myexp(n, x)
    else
        return 1 / myexp(n, -x)
    end
end
