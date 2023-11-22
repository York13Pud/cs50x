#include <cs50.h>
#include <math.h>
#include <stdio.h>
#include <string.h>

int main(void) 
{
    // Ask the user for some text to be checked:
    string text = get_string("Text: ");

    // Count number of chars in the text provided by the user:
    float letters = 0;

    for (int i = 0, n = strlen(text); i < n; i++)
    {
        if ((text[i] >= '97' && text[i] <= '122') || (text[i] >= '65' && text[i] <= '90'))
        {
            letters++;
        }
    }

    // Count number of words in the text provided by the user:
    float words = 1;

    for (int i = 0, n = strlen(text); i < n; i++)
    {
        if (text[i] == 32)
        {
            words++;
        }
    }

    // Count number of sentences in the text provided by the user:
    float sentences = 0;

    for (int i = 0, n = strlen(text); i < n; i++)
    {
        if (text[i] == 46 || text[i] == 33 || text[i] == 63)
        {
            sentences++;
        }
    }

    // Calculate average number of letters & sentences per 100 words of the provided text:
    float L = 100 * (letters / words);
    float S = 100 * (sentences / words);

    int index = round(0.0588 * L - 0.296 * S - 15.8);

    // Print the result:
    if (index < 1)
    {
        printf("Before Grade 1\n");
    }
    else if (index > 16)
    {
        printf("Grade 16+\n");
    }
    else
    {
        printf("Grade %i\n", index);
    }
}