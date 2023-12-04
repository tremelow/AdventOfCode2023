function line_intersection(line)
    _, card1, card2 = strip.(split(line, c -> c == '|' || c == ':'))
    to_numbers = card -> parse.(Int, split(card, r"\s+"))
    card1, card2 = to_numbers(card1), to_numbers(card2)
    return length(intersect(card1, card2))
end

function line_to_score(line)
    n = line_intersection(line)
    return (n == 0) ? 0 : 2^(n - 1)
end

function day4a(fname)
    data = readlines(fname)
    return sum(line_to_score.(data))
end

function day4b(fname)
    data = readlines(fname)
    cards = map(line_intersection, data)
    weights = ones(Int, length(data))
    
    for (j, c) in enumerate(cards)
        c = min(length(data) - j, c)
        weights[j+1:j+c] .+= weights[j]
    end
    return sum(weights)
end