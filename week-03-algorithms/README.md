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

The problem with this method is speed. If `n` is towards the beginning, it can be a quick algorithm but if it's not, it can be slow depending upon the size of the array.

The above works only with numbers but not with strings. To do that, you need to use the `strings.h` library. In addition, let's use a `struct` to create our own custom datatype which has both a name and a phone number to produce a (basic) phone book.

``` c
// Implements a phone book with structs

#include <cs50.h>
#include <stdio.h>
#include <string.h>

typedef struct
{
    string name;
    string number;
}
person;

int main(void)
{
    person people[2];

    people[0].name = "Carter";
    people[0].number = "+1-617-495-1000";

    people[1].name = "David";
    people[1].number = "+1-949-468-2750";

    // Search for name
    string name = get_string("Name: ");
    for (int i = 0; i < 2; i++)
    {
        if (strcmp(people[i].name, name) == 0)
        {
            printf("Found %s\n", people[i].number);
            return 0;
        }
    }
    printf("Not found\n");
    return 1;
}
```

A struct in C works in a similar way to that of a struct in Swift.
