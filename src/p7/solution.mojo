struct Matrix2D:
    var rows: Int
    var cols: Int
    var data: List[Int]

    def __init__(out self, rows: Int, cols: Int):
        self.rows = rows
        self.cols = cols
        self.data = List[Int](fill=0, length=rows * cols)

    def __getitem__(self, r: Int, c: Int) -> Int:
        return self.data[r * self.cols + c]

    def __setitem__(mut self, r: Int, c: Int, val: Int):
        self.data[r * self.cols + c] = val

struct Grid3D:
    var layers: Int
    var rows: Int
    var cols: Int
    var data: List[Int]

    def __init__(out self, layers: Int, rows: Int, cols: Int):
        self.layers = layers
        self.rows = rows
        self.cols = cols
        self.data = List[Int](fill=0, length=layers * rows * cols)

    def __getitem__(self, l: Int, r: Int, c: Int) -> Int:
        return self.data[l * self.rows * self.cols + r * self.cols + c]

    def __setitem__(mut self, l: Int, r: Int, c: Int, val: Int):
        self.data[l * self.rows * self.cols + r * self.cols + c] = val

def parse_grid(istring: String) -> Tuple[Int, Int]:
    var parts = istring.split(" ")
    try:
        return (Int(parts[0]), Int(parts[1]))
    except:
        print("Failed to parse grid size from string: " + istring)
        return (0, 0)

def dp(rows: Int, cols: Int) -> Int:
    var matrix = Matrix2D(rows, cols)
    matrix[rows - 1, cols - 1] = 1
    for c in range(cols - 1, -1, -1):
        for r in range(rows - 1, -1, -1):
            if r == rows - 1 and c == cols - 1:
                continue
            var right = 0 if c == cols - 1 else matrix[r, c + 1]
            var down = 0 if r == rows - 1 else matrix[r + 1, c]
            matrix[r, c] = right + down
    return matrix[0, 0]

def part1(input: List[String]) -> String:
    var grids = [parse_grid(s) for s in input]
    var count = 0
    for (rows, cols) in grids:
        count += dp(rows, cols)
    return String(count)