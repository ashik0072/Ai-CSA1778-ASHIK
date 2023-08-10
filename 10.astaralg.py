import heapq
def a_star(graph, start, goal, heuristic):
    open_list = [(0, start)]  
    came_from = {}  
    g_score = {node: float('inf') for node in graph}
    g_score[start] = 0
    f_score = {node: float('inf') for node in graph}
    f_score[start] = heuristic[start]
    while open_list:
        _, current = heapq.heappop(open_list)
        if current == goal:
            return reconstruct_path(came_from, current)
        for neighbor, cost in graph[current].items():
            tentative_g_score = g_score[current] + cost
            if tentative_g_score < g_score[neighbor]:
                came_from[neighbor] = current
                g_score[neighbor] = tentative_g_score
                f_score[neighbor] = g_score[neighbor] + heuristic[neighbor]
                heapq.heappush(open_list, (f_score[neighbor], neighbor))
    return None 
def reconstruct_path(came_from, current):
    path = [current]
    while current in came_from:
        current = came_from[current]
        path.append(current)
    return path[::-1]
graph = {
    'A': {'B': 1, 'C': 3},
    'B': {'A': 1, 'D': 4},
    'C': {'A': 3, 'D': 1},
    'D': {'B': 4, 'C': 1, 'E': 2},
    'E': {'D': 2}
}
start_node = 'A'
goal_node = 'E'
heuristic = {
    'A': 5,
    'B': 4,
    'C': 2,
    'D': 2,
    'E': 0
}
path = a_star(graph, start_node, goal_node, heuristic)
if path:
    print("Shortest path:", path)
else:
    print("No path found")
