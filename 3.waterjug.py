def gcd(a, b):
    while b:
        a, b = b, a % b
    return a
def water_jug_problem(capacity_a, capacity_b, target):
    visited_states = set()
    def dfs(state):
        if state in visited_states:
            return False
        visited_states.add(state)
        if state[0] == target or state[1] == target:
            return True
        next_states = []
        next_states.append((capacity_a, state[1]))
        next_states.append((state[0], capacity_b))
        next_states.append((0, state[1]))
        next_states.append((state[0], 0))
        pour_amount = min(state[0], capacity_b - state[1])
        next_states.append((state[0] - pour_amount, state[1] + pour_amount))
        pour_amount = min(capacity_a - state[0], state[1])
        next_states.append((state[0] + pour_amount, state[1] - pour_amount))
        for next_state in next_states:
            if dfs(next_state):
                return True
        return False
    if target % gcd(capacity_a, capacity_b) == 0:
        return dfs((0, 0))
    else:
        return False
capacity_a = 4
capacity_b = 3
target = 2
if water_jug_problem(capacity_a, capacity_b, target):
    print("Solution exists")
else:
    print("Solution does not exist")
