function line_to_score(line)
    _, card1, card2 = strip.(split(line, c -> c == '|' || c == ':'))

    to_numbers = card -> parse.(Int, split(card, r"\s+"))

    card1, card2 = to_numbers(card1), to_numbers(card2)
    n_common = length(intersect(card1, card2))
    score = (n_common == 0) ? 0 : 2^(n_common - 1)
    return score
end

function day4a(fname)
    data = readlines(fname)
    return sum(line_to_score.(data))
end
