@fieldwise_init
struct Bird:
    var x: Int
    var y: Int
    var vx: Int
    var vy: Int
    var N: Int

    def step(mut self, steps: Int):
        var nx = wrapp_idx(self.x + self.vx * steps, self.N)
        var ny = wrapp_idx(self.y + self.vy * steps, self.N)
        self.x = nx
        self.y = ny

    def in_frame(self) -> Bool:
        var l = self.N / 4
        return self.x >= l and self.x < 3*l and self.y >= l and self.y < 3*l

def wrapp_idx(i: Int, N: Int) -> Int:
    return (i % N + N) % N

def parse_bird(istring: String, N: Int) -> Bird:
    var parts = istring.split(",")
    try:
        return Bird(0, 0, Int(parts[0]), Int(parts[1]), N)
    except:
        print("Failed to parse point from string: " + istring)
        return Bird(0, 0, 0, 0, N)

def part1(input: List[String]) -> String:
    var N = 1000
    var total_steps = 100
    var birds = [parse_bird(part, N) for part in input]
    var count = 0
    for i in range(len(birds)):
        birds[i].step(total_steps)
        if birds[i].in_frame():
            count += 1
    return String(count)

def part2(input: List[String]) -> String:
    var N = 1000
    var total_steps = 3600
    var pictures = 1000
    var birds = [parse_bird(part, N) for part in input]
    var count = 0
    for _ in range(pictures):
        for i in range(len(birds)):
            birds[i].step(total_steps)
            if birds[i].in_frame():
                count += 1
    return String(count)

def part3(input: List[String]) -> String:
    var N = 1000
    var total_steps = 31556926
    var pictures = 1000
    var birds = [parse_bird(part, N) for part in input]
    var count = 0
    for _ in range(pictures):
        for i in range(len(birds)):
            birds[i].step(total_steps)
            if birds[i].in_frame():
                count += 1
    return String(count)
