from util.data_handling import get_lines
from p1 import solution as p1sol
from p2 import solution as p2sol
from p3 import solution as p3sol
from p4 import solution as p4sol
from p5 import solution as p5sol
from p6 import solution as p6sol
from p7 import solution as p7sol

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
    lines = get_lines("data/4.txt")
    print("4-1: " + p4sol.part1(lines))
    print("4-2: " + p4sol.part2(lines))
    print("4-3: " + p4sol.part3(lines))
    lines = get_lines("data/5.txt")
    print("5-1: " + p5sol.part1(lines))
    print("5-2: " + p5sol.part2(lines))
    print("5-3: " + p5sol.part3(lines))
    lines = get_lines("data/6.txt")
    print("6-1: " + p6sol.part1(lines))
    print("6-2: " + p6sol.part2(lines))
    print("6-3: " + p6sol.part3(lines))
    lines = get_lines("data/7.txt")
    print("7-1: " + p7sol.part1(lines))
    print("7-2: " + p7sol.part2(lines))
    print("7-3: " + p7sol.part3(lines))
