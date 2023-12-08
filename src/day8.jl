import Base.Iterators: Stateful, cycle

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
    directions = Stateful(cycle(to_index.(only.(split(data[1], "")))))
    nodes = Dict(parse_node.(data[3:end])...)

    state, steps = "AAA", 0
    while state != "ZZZ"
        dir = popfirst!(directions)
        state = nodes[state][dir]
        steps += 1
    end
    return steps
end

function day8b(fname)
    data = readlines(fname)
    directions = Stateful(cycle(to_index.(only.(split(data[1], "")))))
    nodes = Dict(parse_node.(data[3:end])...)

    state = collect(filter(k -> k[3] == 'A', keys(nodes)))
    cycle_length = [0 for _ in state]
    steps = 0
    while any(==(0), cycle_length)
        dir = popfirst!(directions)
        steps += 1
        for (i, (s, l)) in enumerate(zip(state, cycle_length))
            state[i] = nodes[s][dir]
            (c == 0) && state[i][end] == 'Z' && (cycle_length[i] = steps)
        end
    end
    return lcm(cycle_length...)
end