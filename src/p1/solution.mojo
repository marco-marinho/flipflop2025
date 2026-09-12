comptime B = UInt8(ord("b"))
comptime N = UInt8(ord("n"))
comptime A = UInt8(ord("a"))
comptime E = UInt8(ord("e"))

def part1(lines: List[List[UInt8]]) -> String:
    var count: UInt64 = 0    
    for line in lines:
        for i in range(len(line) - 1):
            var curr = line[i]
            var next = line[i + 1]
            if (curr == B or curr == N) and (next == A or next == E):
                count += 1
    return String(count)

def part2(lines: List[List[UInt8]]) -> String:
    var count: UInt64 = 0    
    for line in lines:
        var buff: UInt64 = 0
        for i in range(len(line) - 1):
            var curr = line[i]
            var next = line[i + 1]
            if (curr == B or curr == N) and (next == A or next == E):
                buff += 1
        if buff % 2 == 0:
            count += buff
    return String(count)

def part3(lines: List[List[UInt8]]) -> String:
    var count: UInt64 = 0    
    for line in lines:
        var buff: UInt64 = 0
        for i in range(len(line) - 1):
            var curr = line[i]
            var next = line[i + 1]
            if curr == B or curr == N:
                if next == A:
                    buff += 1
                else:
                    buff = 0
                    break
        count += buff
    return String(count)

