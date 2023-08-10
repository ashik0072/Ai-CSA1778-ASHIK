from collections import deque

class State:
    def __init__(self, missionaries, cannibals, boat):
        self.missionaries = missionaries
        self.cannibals = cannibals
        self.boat = boat

    def is_valid(self):
        if self.missionaries < 0 or self.cannibals < 0:
            return False
        if self.missionaries > 3 or self.cannibals > 3:
            return False
        if self.missionaries < self.cannibals and self.missionaries > 0:
            return False
        if 3 - self.missionaries < 3 - self.cannibals and 3 - self.missionaries > 0:
            return False
        return True

    def is_goal(self):
        return self.missionaries == 0 and self.cannibals == 0

    def __eq__(self, other):
        return self.missionaries == other.missionaries and self.cannibals == other.cannibals and self.boat == other.boat

    def __hash__(self):
        return hash((self.missionaries, self.cannibals, self.boat))

def successors(state):
    children = []
    if state.boat == "left":
        for m in range(2):
            for c in range(2):
                if m + c >= 1 and m + c <= 2:
                    new_state = State(state.missionaries - m, state.cannibals - c, "right")
                    if new_state.is_valid():
                        children.append(new_state)
    else:
        for m in range(2):
            for c in range(2):
                if m + c >= 1 and m + c <= 2:
                    new_state = State(state.missionaries + m, state.cannibals + c, "left")
                    if new_state.is_valid():
                        children.append(new_state)
    return children

def bfs(initial_state):
    visited = set()
    queue = deque([initial_state])
    while queue:
        state = queue.popleft()
        if state.is_goal():
            return state
        visited.add(state)
        for child in successors(state):
            if child not in visited and child not in queue:
                queue.append(child)
    return None

initial_state = State(3, 3, "left")
solution = bfs(initial_state)

if solution:
    print("Solution found!")
    path = [solution]
    while solution != initial_state:
        solution = [state for state in successors(solution) if state in visited][0]
        path.insert(0, solution)
    for i, state in enumerate(path):
        print(f"Step {i}: Missionaries: {state.missionaries} Cannibals: {state.cannibals} Boat: {state.boat}")
else:
    print("No solution found.")
