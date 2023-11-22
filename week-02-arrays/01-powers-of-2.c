#include <cs50.h>
#include <stdio.h>

int main(void)
{
    // Create a starting value for the size of the array:
    int size = 0;

    // Ask the user for a positive number that is more than 0:
    do
    {
        size = get_int("Enter a size for the array: ");
    } 
    while (size <= 0);

    // Create an array with the size defined from the users input.
    // Also, set the first entry [0] in the array to 1:
    int powers[size];
    powers[0] = 1;

    // Calculate the powers of what the user entered:
    for (int i = 1; i < size; i++)
    {
        powers[i] = 2 * powers[i - 1];
    }

    // Display the array values:
    for (int i = 0; i < size; i++)
    {
        printf("%i\n", powers[i]);
    }
    
}