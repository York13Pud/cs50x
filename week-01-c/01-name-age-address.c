#include <cs50.h>
#include <stdio.h>

int main(void) 
{
    string name = get_string("What is your name?: ");
    int age = get_int("What is your age?: ");
    string phone = get_string("What is your phone number?: ");

    printf("\nYour name is %s. \nYour age is %i. \nYour phone number is %s", name, age, phone);

    return 0;
}