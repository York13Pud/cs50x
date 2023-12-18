// Implements a dictionary's functionality
#include <ctype.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>

#include "dictionary.h"

unsigned int countSize = 0;

// Build a struct for a node in a hash table:
typedef struct node
{
    char word[LENGTH + 1];
    struct node *next;
} node;

// The number of buckets in a given hash table:
const unsigned int N = 500;

// Build a hHash table:
node *table[N];

// Returns true if the word is in the dictionary, otherwise it will be false:
bool check(const char *word)
{
    int index = hash(word);

    node *cursor = table[index];

    while (cursor != NULL)
    {
        if (strcasecmp(cursor->word, word) == 0)
        {
            return true;
        }
        cursor = cursor->next;
    }
    return false;
}

// Hashes the word to a number:
unsigned int hash(const char *word)
{
    unsigned int value = 0;
    unsigned int key_len = strlen(word);
    for (int i = 0; i < key_len; i++)
    {
        value = value + 37 * tolower(word[i]);
    }
    value = value % N;
    return value;
}

// Loads the dictionary into RAM:
bool load(const char *dictionary)
{
    FILE *open_dictionary = fopen(dictionary, "r");
    if (open_dictionary == NULL)
    {
        return false;
    }
    char Dword[LENGTH + 1];
    while (fscanf(open_dictionary, "%s", Dword) != EOF)
    {
        node *newNode = malloc(sizeof(node));
        if (newNode == NULL)
        {
            return false;
        }
        strcpy(newNode->word, Dword);
        newNode->next = NULL;
        int index = hash(Dword);

        if (table[index] == NULL)
        {
            table[index] = newNode;
        }
        else
        {
            newNode->next = table[index];
            table[index] = newNode;
        }
        countSize++;
    }
    fclose(open_dictionary);
    return true;
}

// Returns the total number of words in dictionary or zero if none:
unsigned int size(void)
{
    return countSize;
}

// Clear the table out of RAM:
bool unload(void)
{
    for (int i = 0; i < N; i++)
        while (table[i] != NULL)
        {
            node *temp = table[i]->next;
            free(table[i]);
            table[i] = temp;
        }
    return true;
}
