
def get_lines(file_path: String) -> List[List[UInt8]]:
    try:
        with open(file_path, "r") as file:
            var contents = file.read()
            return [List(line.bytes()) for line in contents.split("\n")]
    except _:
        print("Error reading file")
        return []