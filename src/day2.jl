function parse_day2(s::AbstractString)
    id, draws = split(s, ":")
    id = parse(Int, split(id, " ")[2])
    draws = split.(strip.(split(draws, ";")), ", ")
    max_drawn = Dict("red" => 0, "green" => 0, "blue" => 0)
    for draw in draws
        for (n, color) in Tuple.(split.(draw, ' '))
            n = parse(Int, n)
            max_drawn[color] = max(max_drawn[color], n)
        end
    end
    return id, Tuple(values(max_drawn))
end

function day2a(fname)
    ref_bag = Tuple(values(Dict("red" => 12, "green" => 13, "blue" => 14)))
    all_drawn = parse_day2.(readlines(fname))
    return sum(x -> x[1], filter(x -> all(x[2] .≤ ref_bag), all_drawn))
end

function day2b(fname)
    ref_bag = Tuple(values(Dict("red" => 12, "green" => 13, "blue" => 14)))
    all_drawn = parse_day2.(readlines(fname))
    powers = map(x -> prod(x[2]), all_drawn)
    return sum(powers)
end