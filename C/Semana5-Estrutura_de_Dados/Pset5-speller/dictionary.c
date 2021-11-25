// Implements a dictionary's functionality

#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include "dictionary.h"

// Represents a node in a hash table
typedef struct node
{
    char word[LENGTH + 1];
    struct node *next;
}
node;

// Number of buckets in hash table
const unsigned int N = 100000;

// Hash table
node *table[N];

// Word counter
int count_words = 0;

// Returns true if word is in dictionary, else false
bool check(const char *word)
{
    // TODO
    char s[strlen(word) + 1];
    //char *s = malloc(sizeof(char) * (strlen(word) + 1));
    for (int i = 0; i < strlen(word); i++)
    {
        s[i] = tolower(word[i]);
    }
    s[strlen(word)] = '\0';
    int hash_value = hash(s);

    if (hash_value >= N)
        return false;

    node *tmp = table[hash_value];
    while (tmp != NULL)
    {
        if (strcmp(tmp->word, s) == 0)
            return true;

        tmp = tmp->next;
    }
    return false;
}

// Hashes word to a number
unsigned int hash(const char *word)  /* djb2 by Dan Bernstein: http://www.cse.yorku.ca/~oz/hash.html */
{
    // TODO
    unsigned long hash = 5381;
    int c;

    while (0 != (c = *word++))
        hash = ((hash << 5) + hash) + c; /* hash * 33 + c */

    return hash%N;
}

// Loads dictionary into memory, returning true if successful, else false
bool load(const char *dictionary)
{
    // TODO
    for (int i = 0; i < N; i++)
    {
        table[i] = NULL;
    }

    FILE* dic = fopen(dictionary, "r");
    if (dic == NULL)
    {
        return false;
    }

    char word[LENGTH + 1];
    int scan = fscanf(dic, "%s", word);
    while (scan != EOF)
    {

        node *n = malloc(sizeof(node));
        if (n == NULL)
        {
            return false;
        }
        n->next = NULL;
        strcpy(n->word , word);
        int hash_value = hash(word);

        if (table[hash_value] == NULL)
        {
            table[hash_value] = n;
        }
        else
        {
            n->next = table[hash_value];
            table[hash_value] = n;
        }
        // Separe n of table[hash_value]
        n = NULL;
        // Increase word counter by 1
        count_words++;
        // Updates scan
        scan = fscanf(dic, "%s", word);
    }
    fclose(dic);
    return true;
}

// Returns number of words in dictionary if loaded, else 0 if not yet loaded
unsigned int size(void)
{
    // TODO
    return count_words;
}

// Unloads dictionary from memory, returning true if successful, else false
bool unload(void)
{
    // TODO
    for(int i = 0; i < N; i++)
    {
        while (table[i] != NULL)
        {
            node *tmp = table[i]->next;
            free(table[i]);
            table[i] = tmp;
        }
    }
    return true;
}
