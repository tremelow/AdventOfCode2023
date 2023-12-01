function first_last_digit(s::AbstractString)
    isint = c -> 0 ≤ (Int(c) - Int('0')) ≤ 9
    i = findfirst(isint, s)
    j = findlast(isint, s)
    return parse(Int, s[i] * s[j])
end

function with_letters(s::AbstractString)
    spelled_out = Dict(
        "one" => 1, "two" => 2, "three" => 3, "four" => 4, "five" => 5, 
        "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9)
    forward_replace = replace(s, spelled_out...)
    
    reverse_spelling = (reverse(k) => v for (k,v) in spelled_out)
    backward_replace = reverse(replace(reverse(s), reverse_spelling...))
    return first_last_digit(forward_replace * backward_replace)
end

function day1a(fname)
    data = readdlm(fname, String)[:]
    return sum(first_last_digit.(data))
end

function day1b(fname)
    data = readdlm(fname, String)[:]
    return sum(with_letters.(data))
end