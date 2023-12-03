"Checks if a string is not a digit or a dot"
is_symbol(s) = !isnothing(findfirst(r"^[^\d\.]$", s))

pos_to_index(l,w) = CartesianIndex((l, w[1])):CartesianIndex((l, w[end]))
pos_to_index(lw) = pos_to_index(lw[1], lw[2])

function extend_window(i, min_index, max_index)
    upper_left = max(i[1] - CartesianIndex((1, 1)), min_index)
    lower_right = min(i[end] + CartesianIndex((1, 1)), max_index)
    return upper_left:lower_right
end

function day3a(fname)
    data = readlines(fname)
    pos = vcat(([(l,p) for p in pos] for (l,pos) in enumerate(findall.(r"\d+", data)))...)
    nb = parse.(Int, map(lp -> data[lp[1]][lp[2]], pos))

    data = permutedims(hcat(split.(data, "")...))
    pos = pos_to_index.(pos)
    min_index, max_index = CartesianIndex((1,1)), CartesianIndex(size(data))
    adj = map(p -> extend_window(p, min_index, max_index), pos)
    next_to_symb = map(w -> any(is_symbol, data[w]), adj)
    return sum(nb .* next_to_symb)
end

function day3b(fname)
    return 0
end