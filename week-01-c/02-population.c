#include <cs50.h>
#include <stdio.h>

int main(void)
{
    int starting_llamas = 0;
    int ending_llamas = 0;
    int years = 0;

    // Ask for the starting number of llamas in the population:
    do
    {
        starting_llamas = get_int("Enter the number of staring llamas: ");
    } 
    while (starting_llamas == 0);

    // Ask for the number of llamas needed in the population:
    do
    {
        ending_llamas = get_int("Enter the required of staring llamas: ");
    } 
    while (ending_llamas < starting_llamas);

    // Work out how many years are required to achieve the population required:
    while (starting_llamas < ending_llamas)
    {
        starting_llamas += starting_llamas / 3;
        starting_llamas += starting_llamas / 4;
        years++;
    }

    // Print the result:
    printf("Total years to population is %i\n", years);
    
}