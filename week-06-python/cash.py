from cs50 import get_float


def calculate_quarters(cents):
    coins = 0
    
    while round(cents, ndigits = 2) / 0.25 >= 1:
        coins += 1
        cents -= 0.25

    return coins


def calculate_dimes(cents):
    coins = 0
    
    while round(cents, ndigits = 2) / 0.10 >= 1:
        coins += 1
        cents -= 0.10

    return coins


def calculate_nickels(cents):
    coins = 0
    
    while round(cents, ndigits = 2) / 0.05 >= 1:
        coins += 1
        cents -= 0.05

    return coins


def calculate_pennies(cents):
    coins = 0
    
    while round(cents, ndigits = 2) / 0.01 >= 1:
        coins += 1
        cents -= 0.01

    return coins


def main():
    cash = float(0)
    
    while cash <= 0:
        cash = get_float("Change owed: ")

    quarters = calculate_quarters(cents = round(cash, ndigits = 2))
    cash = round(cash, ndigits = 2) - (quarters * 0.25)

    dimes = calculate_dimes(cents = cash)
    cash = round(cash, ndigits = 2) - (dimes * 0.10)

    nickels = calculate_nickels(cents = cash)
    cash = round(cash, ndigits = 2) - (nickels * 0.05)

    pennies = calculate_pennies(cents = cash)
    cash = round(cash, ndigits = 2) - (pennies * 0.01)

    coins = quarters + dimes + nickels + pennies

    print(f"{coins}\n")

main()