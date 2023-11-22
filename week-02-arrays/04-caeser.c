#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, string argv[])
{

    // Check if there are two arguments in argc. If not, provide the user with usage instructions:
    if (argc != 2)
    {
        printf("Usage: ./caesar key");
        return 1;
    }

    // Check if one of the arguments is alpha numeric. If so, provide the user with usage instructions:
    for (int key = 0; key < strlen(argv[1]); key++)
    {
        if (isalpha(argv[1][key]))
        {
            printf("Usage: ./caesar key");
            return 1;
        }
    }

    // Convert the cipher number (string) to an integer.
    // Linux always passes args as strings to a program or script:
    int key = atoi(argv[1]) % 26;

    // Ask the user for the text:
    string plaintext = get_string("plaintext: ");

    printf("ciphertext: ");

    // Perform the cipher conversion:
    for (int i = 0, length = strlen(plaintext); i < length; i++)
    {
        if (!isalpha(plaintext[i]))
        {
            // Print the current item in the array if it isn't alpha numeric:
            printf("%c", plaintext[i]);
            continue;
        }

        // Check if the current element is in uppercase
        int offset = isupper(plaintext[i]) ? 65 : 97;
        int pi = plaintext[i] - offset;

        // Get the index of the letter:
        int ci = (pi + key) % 26;

        // Print the ciphered character:
        printf("%c", ci + offset);
    }

    printf("\n");

    return 0;
}