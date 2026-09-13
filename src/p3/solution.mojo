@fieldwise_init
struct RGB(Equatable, Hashable, Movable, ImplicitlyCopyable):
    var r: Int
    var g: Int
    var b: Int

    def __eq__(self, other: RGB) -> Bool:
        return self.r == other.r and self.g == other.g and self.b == other.b

    def __hash__(self) -> Int:
        return Int((self.r << 16) | (self.g << 8) | self.b)

    def is_special(self) -> Bool:
        return self.r == self.g or self.g == self.b or self.r == self.b

    def is_green(self) -> Bool:
        return not self.is_special() and self.g > self.r and self.g > self.b

    def is_blue(self) -> Bool:
        return not self.is_special() and self.b > self.r and self.b > self.g

    def is_red(self) -> Bool:
        return not self.is_special() and self.r > self.g and self.r > self.b

comptime COMMA = UInt8(ord(","))
comptime ZERO = UInt8(ord("0"))
comptime NINE = UInt8(ord("9"))

def parse_rgb(istring: String) -> RGB:
    var parts = istring.split(",") 
    try:
        return RGB(Int(parts[0]), Int(parts[1]), Int(parts[2]))
    except:
        print("Failed to parse RGB from string: " + istring)
        return RGB(0, 0, 0)

def part1(lines: List[String]) -> String: 
    var counts: Dict[RGB, UInt32] = {}
    var max_rgb: RGB = RGB(0, 0, 0)
    var max_count: UInt32 = 0
    for line in lines:
        var rgb = parse_rgb(line)
        counts[rgb^] = counts.get(rgb, 0) + 1
    for item in counts.items():
        if item.value > max_count:
            max_count = item.value
            max_rgb = item.key
    return String(max_rgb.r) + "," + String(max_rgb.g) + "," + String(max_rgb.b)

def part2(lines: List[String]) -> String:
    var greens = 0 
    for line in lines:
        var rgb = parse_rgb(line)
        if rgb.is_green():
            greens += 1
    return String(greens)

def part3(lines: List[String]) -> String:
    var value = 0 
    for line in lines:
        var rgb = parse_rgb(line)
        if rgb.is_red():
            value += 5
        elif rgb.is_green():
            value += 2
        elif rgb.is_blue():
            value += 4
        else:
            value += 10
    return String(value)