#include <cs50.h>
#include <stdio.h>

int main(void)
{
    // Set the required variables:
    int blocks = 0;

    // Ask the user to input a number between 1 and 8:
    do
    {
        blocks = get_int("Height (between 1 and 8): ");
    } 
    while (blocks < 1 || blocks > 8);
    
    // Show the value stored in blocks:
    printf("Stored: %i\n", blocks);

    // Create a half pyramid of blocks aligned to the left:
    for (int i = 0; i < blocks; i++)
    {
        for (int j = 0; j < i + 1; j++)
        {
            printf("#");
        }
        printf("\n");

    }

    // Create a half pyramid of blocks aligned to the right:
    for (int i = 1; i <= blocks; i++)
    {
        printf("%*.*s\n", blocks, i, "########");
    }

    return 0;
}