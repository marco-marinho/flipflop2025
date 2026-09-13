
def get_lines(file_path: String) -> List[String]:
    try:
        with open(file_path, "r") as file:
            var contents = file.read()
            return [String(line) for line in contents.split("\n")]
    except _:
        print("Error reading file")
        return []