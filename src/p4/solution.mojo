def parse_point(istring: String) -> Tuple[Int, Int]:
    var parts = istring.split(",")
    try:
        return (Int(parts[0]), Int(parts[1]))
    except:
        print("Failed to parse point from string: " + istring)
        return (0, 0)
   
def part1(lines: List[String]) -> String:
    var current = (0, 0)
    var distance = 0
    for line in lines:
        var point = parse_point(line)
        distance += abs(point[0] - current[0]) + abs(point[1] - current[1])
        current = point
    return String(distance)

def part2(lines: List[String]) -> String:
    var current = (0, 0)
    var distance = 0
    for line in lines:
        var point = parse_point(line)
        var d1 = abs(point[0] - current[0]) 
        var d2 = abs(point[1] - current[1])
        var max_d = max(d1, d2)
        var min_d = min(d1, d2)
        var diff = max_d - min_d
        distance += (min_d + diff)
        current = point
    return String(distance)

def part3(lines: List[String]) -> String:

    def cmp(a: Tuple[Int, Int], b: Tuple[Int, Int]) capturing -> Bool:
        return (a[0] + a[1]) < (b[0] + b[1])

    var current = (0, 0)
    var distance = 0
    var points = [parse_point(line) for line in lines]
    sort[cmp_fn=cmp](points)
    for point in points:
        var d1 = abs(point[0] - current[0]) 
        var d2 = abs(point[1] - current[1])
        var max_d = max(d1, d2)
        var min_d = min(d1, d2)
        var diff = max_d - min_d
        distance += (min_d + diff)
        current = point
    return String(distance)