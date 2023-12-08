using AdventOfCode23
using Test

@testset "Day 1" begin
    include("day1.jl")
end
@testset "Day 2" begin
    include("day2.jl")
end
@testset "Day 3" begin
    @test day3a("exemple/day3.txt") == 4361
    @test day3b("exemple/day3.txt") == 467835
end
@testset "Day 4" begin
    include("day4.jl")
end
@testset "Day 5" begin
    @test day5a("exemple/day5.txt") == 35
end

@testset "Day 8" begin
    @test day8a("exemple/day8a.txt") == 2
    @test day8a("exemple/day8b.txt") == 6
    @test day8b("exemple/day8c.txt") == 6
end

