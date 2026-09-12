comptime UP = UInt8(ord('^'))
comptime DOWN = UInt8(ord('v'))
comptime FLAT = UInt8(ord('-'))

def part1(lines: List[List[UInt8]]) -> String: 
    ref line = lines[0]
    var position = 0
    var max_position = 0
    for command in line:
        if command == UP:
            position += 1
        elif command == DOWN:
            position -= 1
        max_position = max(max_position, position)
    return String(max_position)

def part2(lines: List[List[UInt8]]) -> String: 
    ref line = lines[0]
    var position = 0
    var max_position = 0
    var prev_direction = FLAT
    var step = 1
    for command in line:
        if command != prev_direction:
            step = 1
        if command == UP:
            position += step
        elif command == DOWN:
            position -= step
        step += 1
        prev_direction = command
        max_position = max(max_position, position)
    return String(max_position)

def fib(n: Int) -> Int:
    if n <= 1:
        return n
    var a = 0
    var b = 1
    for _ in range(2, n + 1):
        var c = a + b
        a = b
        b = c
    return b

def part3(lines: List[List[UInt8]]) -> String:
    var line = lines[0].copy()
    line.append(FLAT)
    var position = 0
    var max_position = 0
    var prev_direction = FLAT
    var acc = 0
    for command in line:
        if command != prev_direction:
            if prev_direction == UP:
                position += fib(acc)
            elif prev_direction == DOWN:
                position -= fib(acc)
            acc = 1
            prev_direction = command
            max_position = max(max_position, position)
        else:
            acc += 1
    max_position = max(max_position, position)
    return String(max_position)