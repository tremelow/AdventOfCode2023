@testset "Individual sets" begin
    data = readlines("exemple/day2.txt")
    @test AdventOfCode23.parse_day2(data[1]) == (1, (6, 2, 4))
    @test AdventOfCode23.parse_day2(data[2]) == (2, (4, 3, 1))
    @test AdventOfCode23.parse_day2(data[3]) == (3, (6, 13, 20))
    @test AdventOfCode23.parse_day2(data[4]) == (4, (15, 3, 14))
    @test AdventOfCode23.parse_day2(data[5]) == (5, (2, 3, 6))
end
@testset "Global" begin
    @test day2a("exemple/day2.txt") == 8
    @test day2b("exemple/day2.txt") == 2286
end