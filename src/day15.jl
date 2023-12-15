hash(s) = foldl((tot, c) -> rem(17*(tot + Int64(c)), 256), s, init=0)

function day15a(fname)
    data = prod(readlines(fname)...)
    data = split(data, ',')
    return sum(hash.(data))
end
