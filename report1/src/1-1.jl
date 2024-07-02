using Random

function MonteCarlo(n)
    Random.seed!(0)
    x = zeros(n)
    y = zeros(n)
    for i = 1:n
        x[i] = rand()
        y[i] = rand()
    end
    r = zeros(n)
    for i = 1:n
        r[i] = x[i]^2 + y[i]^2
    end
    m = 0
    for i = 1:n
        if r[i] <= 1
            m = m + 1
        end
    end
    p = 4*m/n
    return p; 
end
