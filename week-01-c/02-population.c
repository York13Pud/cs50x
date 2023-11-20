#include <cs50.h>
#include <stdio.h>

int main(void)
{
    int starting_llamas = 0;
    int ending_llamas = 0;
    int years = 0;
    int population = 0;

    // Ask for the starting number of llamas in the population:
    do
    {
        starting_llamas = get_int("Enter the number of staring llamas: ");
    } 
    while (starting_llamas < 9);

    // Ask for the number of llamas needed in the population:
    do
    {
        ending_llamas = get_int("Enter the required of staring llamas: ");
    } 
    while (ending_llamas < starting_llamas);

    // Work out how many years are required to achieve the population required:
    population = starting_llamas;
    
    while (ending_llamas > population)
    {
        population = population + (population / 3) - (population / 4);
        years++;
    }

    // Print the result:
    printf("Years: %i", years);
    
    return 0;
}