def color_map(graph, colors):
    color_assignment = {}
    for node in graph:
        used_colors = set()
        for neighbor in graph[node]:
            if neighbor in color_assignment:
                used_colors.add(color_assignment[neighbor])
        available_colors = colors - used_colors
        if available_colors:
            chosen_color = min(available_colors)
            color_assignment[node] = chosen_color
    return color_assignment
graph = {
    'WA': ['NT', 'SA'],
    'NT': ['WA', 'SA', 'Q'],
    'SA': ['WA', 'NT', 'Q', 'NSW', 'V'],
    'Q': ['NT', 'SA', 'NSW'],
    'NSW': ['Q', 'SA', 'V'],
    'V': ['SA', 'NSW']
}
available_colors = {'Red', 'Green', 'Blue', 'Yellow'}
color_assignment = color_map(graph, available_colors)
for node, color in color_assignment.items():
    print(f"Node {node} is colored {color}")
