function to_index(c::Char)
    if c == 'L'; 1
    elseif c == 'R'; 2
    else; @error "Unrecognised direction."
    end
end

function parse_node(node)
    src, dest1, dest2 = match(r"(\w+) = \((\w+), (\w+)\)", node).captures
    return src => (dest1, dest2)
end

function day8a(fname)
    data = readlines(fname)
    directions = to_index.(only.(split(data[1], "")))
    n_dir = length(directions)
    nodes = Dict(parse_node.(data[3:end])...)

    state, steps = "AAA", 0
    while state != "ZZZ"
        dir = directions[mod(steps, n_dir) + 1]
        state = nodes[state][dir]
        steps += 1
    end
    return steps
end

function day8b(fname)
    data = readlines(fname)
    directions = to_index.(only.(split(data[1], "")))
    n_dir = length(directions)
    nodes = Dict(parse_node.(data[3:end])...)

    state = collect(filter(k -> k[3] == 'A', keys(nodes)))
    cycle_length = [0 for _ in state]
    steps = 0

    while any(==(0), cycle_length)
        dir = directions[mod(steps, n_dir) + 1]

        for (i, (s, l)) in enumerate(zip(state, cycle_length))
            state[i] = nodes[s][dir]
            (l == 0) && (s[end] == 'Z') && (cycle_length[i] = steps)
        end
        steps += 1
    end
    return lcm(cycle_length...)
end