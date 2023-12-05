function generate_shift_function(dest_idx, src_idx, len)
    function shift(idx, modified)
        if !modified && (0 ≤ idx - src_idx < len)
            idx += dest_idx - src_idx
            modified = true
        end
        return idx, modified
    end
    return shift
end

function day5a(fname)
    data = strip(String(read(fname)))
    data = split(data, "\n\n")
    maps = [Function[] for _ in data[2:end]]
    for (i,group) in enumerate(data[2:end])
        for mapping in split(group, "\n")[2:end]
            dest_idx, src_idx, len = parse.(Int, split(mapping, r"\s+"))
            push!(maps[i], generate_shift_function(dest_idx, src_idx, len))
        end
    end

    seeds = parse.(Int, split(data[1], r"\s|\:\s")[2:end])
    modif = [false for _ in seeds]
    for group in maps
        for map in group
            for i in eachindex(seeds)
                seeds[i], modif[i] = map(seeds[i], modif[i])
            end
        end
        modif .= false
    end

    return minimum(seeds)
end
