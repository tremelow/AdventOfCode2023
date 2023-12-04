@testset "Individual sets" begin
    data = readlines("exemple/day4.txt")
    @test AdventOfCode23.line_to_score(data[1]) == 8
    @test AdventOfCode23.line_to_score(data[2]) == 2
    @test AdventOfCode23.line_to_score(data[3]) == 2
    @test AdventOfCode23.line_to_score(data[4]) == 1
    @test AdventOfCode23.line_to_score(data[5]) == 0
    @test AdventOfCode23.line_to_score(data[6]) == 0
end
@testset "Global" begin
    @test day4a("exemple/day4.txt") == 13
    @test day4b("exemple/day4.txt") == 30
end