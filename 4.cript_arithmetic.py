from itertools import permutations
def solve_cryptarithmetic(puzzle):
    unique_chars = set(''.join(puzzle))
    if len(unique_chars) > 10:
        print("Too many unique characters (more than 10).")
        return
    for perm in permutations(range(10), len(unique_chars)):
        char_to_digit = {char: digit for char, digit in zip(unique_chars, perm)}
        translated_puzzle = ''.join(str(char_to_digit[char]) if char.isalpha() else char for char in puzzle)
        if eval(translated_puzzle):
            return char_to_digit
    return None
puzzle = "SEND + MORE = MONEY"
solution = solve_cryptarithmetic(puzzle)
if solution:
    print("Solution found:")
    for char, digit in solution.items():
        print(f"{char} = {digit}")
else:
    print("No solution found.")
