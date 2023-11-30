# Sorting Algorithms

## Linear Sort

A linear sort will go through all the items sequentially until it finds what you are looking for. An example would be going through an array with a for or while loop to find a match to a defined criteria.

For example, find the number 50 in an array:

``` c
#include <cs50.h>
#include <stdio.h>

int main(void)
{
    int numbers[] = {20, 500, 10, 5, 100, 1, 50};
    int n = 50;

    for(int i = 0, i < 7, i++)
    {
        if (numbers[i] == n)
        {
            printf("Found 50!\n");
            return 0;
        }
    }
    printf("Didn't find 50!\n");
    return 1;
}
```

The problem with this method is speed. If `n` is towards the begining, it can be a quick algorithm but if it's not, it can be slow depending upon the size of the array.
