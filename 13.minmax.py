def print_piles(piles):
    print("Piles:")
    for i, count in enumerate(piles):
        print(f"Pile {i + 1}: {count} stones")
    print()

def get_human_move(piles):
    while True:
        pile = int(input("Select a pile (1, 2, ...): ")) - 1
        if 0 <= pile < len(piles) and piles[pile] > 0:
            return pile

def get_computer_move(piles):
    best_move = None
    best_score = -float('inf')

    for pile in range(len(piles)):
        for remove_count in range(1, piles[pile] + 1):
            new_piles = piles[:]
            new_piles[pile] -= remove_count

            score = minimax(new_piles, False)
            if score > best_score:
                best_score = score
                best_move = (pile, remove_count)

    return best_move

def minimax(piles, is_maximizing):
    if all(count == 0 for count in piles):
        return -1 if is_maximizing else 1

    if is_maximizing:
        best_score = -float('inf')
        for pile in range(len(piles)):
            for remove_count in range(1, piles[pile] + 1):
                new_piles = piles[:]
                new_piles[pile] -= remove_count

                score = minimax(new_piles, False)
                best_score = max(score, best_score)
        return best_score
    else:
        best_score = float('inf')
        for pile in range(len(piles)):
            for remove_count in range(1, piles[pile] + 1):
                new_piles = piles[:]
                new_piles[pile] -= remove_count

                score = minimax(new_piles, True)
                best_score = min(score, best_score)
        return best_score

def main():
    piles = [3, 5, 7]

    print("Welcome to Nim!")
    print_piles(piles)

    while True:
        human_pile, human_remove = get_human_move(piles)
        piles[human_pile] -= human_remove
        print_piles(piles)

        if all(count == 0 for count in piles):
            print("Computer wins!")
            break

        computer_pile, computer_remove = get_computer_move(piles)
        piles[computer_pile] -= computer_remove
        print(f"Computer removes {computer_remove} from pile {computer_pile + 1}")
        print_piles(piles)

        if all(count == 0 for count in piles):
            print("You win!")
            break

if __name__ == "__main__":
    main()
