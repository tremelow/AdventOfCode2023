@testset "First and last digit" begin
    data = readdlm("exemple/day1a.txt")[:]
    @test AdventOfCode23.first_last_digit(data[1]) == 12
    @test AdventOfCode23.first_last_digit(data[2]) == 38
    @test AdventOfCode23.first_last_digit(data[3]) == 15
    @test AdventOfCode23.first_last_digit(data[4]) == 77
end
@testset "With letters" begin
    vals = [29, 83, 13, 24, 42, 14, 76]
    data = readdlm("exemple/day1b.txt")[:]
    for (s,v) in zip(data, vals)
        @test AdventOfCode23.with_letters(s) == v
    end
end
@testset "Global" begin
    @test day1a("exemple/day1a.txt") == 142
    @test day1b("exemple/day1b.txt") == 281
end