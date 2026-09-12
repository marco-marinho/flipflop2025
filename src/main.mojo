from util.data_handling import get_lines
from p1 import solution as p1sol
from p2 import solution as p2sol
from p3 import solution as p3sol

def main():
    var lines = get_lines("data/1.txt")
    print("1-1: " + p1sol.part1(lines))
    print("1-2: " + p1sol.part2(lines))
    print("1-3: " + p1sol.part3(lines))
    lines = get_lines("data/2.txt")
    print("2-1: " + p2sol.part1(lines))
    print("2-2: " + p2sol.part2(lines))
    print("2-3: " + p2sol.part3(lines))
    lines = get_lines("data/3.txt")
    print("3-1: " + p3sol.part1(lines))
    print("3-2: " + p3sol.part2(lines))
    print("3-3: " + p3sol.part3(lines))
