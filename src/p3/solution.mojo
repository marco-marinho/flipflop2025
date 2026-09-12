
struct RGB(Equatable, Hashable, Movable, ImplicitlyCopyable):
    var r: UInt32
    var g: UInt32
    var b: UInt32

    def __init__(out self, r: UInt32, g: UInt32, b: UInt32):
        self.r = r
        self.g = g
        self.b = b

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

def parse_rgb_bytes(bytes: List[UInt8]) -> RGB:
    var channels = 0
    var output: RGB = RGB(0, 0, 0)
    var acc: UInt32 = 0
    
    for i in range(len(bytes)):
        var char = bytes[i]
        
        if char == COMMA:
            if channels == 0:
                output.r = acc
                acc = 0
            elif channels == 1:
                output.g = acc
                acc = 0
            channels += 1
        elif char >= ZERO and char <= NINE:
            acc = (acc * 10) + UInt32(char - ZERO)
            
    output.b = acc

    return output^

def part1(lines: List[List[UInt8]]) -> String: 
    var counts: Dict[RGB, UInt32] = {}
    var max_rgb: RGB = RGB(0, 0, 0)
    var max_count: UInt32 = 0
    for line in lines:
        var rgb = parse_rgb_bytes(line)
        counts[rgb] = counts.get(rgb, 0) + 1
    for item in counts.items():
        if item.value > max_count:
            max_count = item.value
            max_rgb = item.key
    return String(max_rgb.r) + "," + String(max_rgb.g) + "," + String(max_rgb.b)

def part2(lines: List[List[UInt8]]) -> String:
    var greens = 0 
    for line in lines:
        var rgb = parse_rgb_bytes(line)
        if rgb.is_green():
            greens += 1
    return String(greens)

def part3(lines: List[List[UInt8]]) -> String:
    var value = 0 
    for line in lines:
        var rgb = parse_rgb_bytes(line)
        if rgb.is_red():
            value += 5
        elif rgb.is_green():
            value += 2
        elif rgb.is_blue():
            value += 4
        else:
            value += 10
    return String(value)