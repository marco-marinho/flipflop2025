
def make_connections(line: String) -> List[Int]:
    var connections = List[Int](length=len(line.bytes()), fill=-1)
    for i in range(len(connections)):
        if connections[i] != -1:
            continue
        for j in range(i + 1, len(connections)):
            if line[byte=i] == line[byte=j]:
                connections[i] = j
                connections[j] = i
                break
    return connections^

def part1(lines: List[String]) -> String:
    ref line = lines[0]
    var connections = make_connections(line)
    var step = 0
    var next = 0
    while next < len(connections):
        step += abs(next - connections[next])
        next = connections[next] + 1
    return String(step)

def part2(lines: List[String]) -> String:
    ref line = lines[0]
    var connections = make_connections(line)
    var visited = List[Bool](length=len(connections), fill=False)
    var next = 0
    while next < len(connections):
        visited[next] = True
        visited[connections[next]] = True
        next = connections[next] + 1
    var ans = String()
    for i in range(len(connections)):
        if not visited[i]:
            ans += line[byte=i]
            visited[connections[i]] = True
    return ans

def part3(lines: List[String]) -> String:
    ref line = lines[0]
    var connections = make_connections(line)
    var step = 0
    var next = 0
    while next < len(connections):
        if line[byte=next].isupper():
            step -= abs(next - connections[next])
        else:
            step += abs(next - connections[next])
        next = connections[next] + 1
    return String(step)