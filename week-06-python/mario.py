from cs50 import get_int

height = 0

while height < 1 or height > 8:
    height = get_int("Height: ")

spaces = height - 1
blocks = 1

for i in range(1, height + 1):
    print(" " * spaces + "#" * blocks)
    blocks += 1
    spaces -= 1