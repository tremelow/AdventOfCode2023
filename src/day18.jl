using SparseArrays


function initialise_matrix(moves)
    unshifted_positions = cumsum(moves)
    min_pos, max_pos = minimum(unshifted_positions), maximum(unshifted_positions)
    size = Tuple(max_pos - min_pos + CartesianIndex(1,1))

    cur_pos = CartesianIndex(1,1) - min_pos
    return cur_pos, zeros(CartesianIndex{2}, size...)
end

function update_depth(state, dir)
    last_seen_dir, digging = state
    if (dir != zero(dir)) && (dir != last_seen_dir)
        last_seen_dir = dir
        digging = !digging
    end
    return last_seen_dir, digging
end

function day18a(fname)
    data = readlines(fname)
    dir_to_unit = Dict(
        'R' => CartesianIndex(0,1), 'L' => CartesianIndex(0,-1),
        'D' => CartesianIndex(1,0), 'U' => CartesianIndex(-1,0),
    )

    directions = [dir_to_unit[s[1]] for s in data]
    velocities = map(s -> parse.(Int, match(r"\d+", s).match), data)

    moves = velocities .* directions
    cur_pos, pos = initialise_matrix(moves)
    for (d, m) in zip(directions, moves)
        next_pos = cur_pos + m
        l, r = minmax(cur_pos, next_pos)
        for idx in l:r # cannot broadcast with CartesianIndex :(
            pos[idx] += d
        end
        cur_pos = next_pos
    end
    h_path, v_path = map(m -> m[1], pos), map(m -> m[2], pos)
    path = map(!=(0), h_path) .|| map(!=(0), v_path)

    init_state = (CartesianIndex(0,0), false)
    h_dig = accumulate((state, m) -> update_depth(state, m[1]), pos, dims=2, init=init_state)
    v_dig = accumulate((state, m) -> update_depth(state, m[2]), pos, dims=1, init=init_state)

    return sum(map(s -> s[2], h_dig) .|| map(s -> s[2], v_dig) .|| path)
end