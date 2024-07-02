function calcA(x, n)
    m = length(x)
    result = zeros(Float64, m, n)
    for i in 1:m
        for j in 1:n
            result[i, j] = x[i] ^ (j - 1)
        end
    end
    return result
end
