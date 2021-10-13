#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <cs50.h>

typedef uint8_t BYTE;

int main(int argc, char *argv[])
{
    if(argc != 2)
    {
        printf("Correct usage: filter [forensic file]");
        return 1;
    }

    FILE* mcard = fopen(argv[1], "r");

    if(mcard == NULL)
    {
        fclose(mcard);
        printf("Could not open %p", argv[1]);
        return 1;
    }

    
    BYTE* buffer = malloc(sizeof(BYTE)*512);
    if (buffer == NULL)
    {
        free(buffer);
    }
    
    char filename[8];
    int img_count = 0;
    sprintf(filename, "%03i.jpg", img_count);
    
    FILE* img = fopen(filename, "a");
    if (img == NULL)
    {
        fclose(img);
    }
    
    bool writing_on = false;
    
    while(fread(buffer, sizeof(BYTE)*512, 1, mcard) != 0)
    {
        if (buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff && (buffer[3] & 0xf0) == 0xe0)
        {
            if (writing_on == false)
            {
                writing_on = true;
                fwrite(buffer, sizeof(BYTE)*512, 1, img);
            }

            else
            {
                fclose(img);
                img_count += 1;
                sprintf(filename, "%03i.jpg", img_count);
                img = fopen(filename, "a");
                fwrite(buffer, sizeof(BYTE)*512, 1, img);
            }
        }
        else
        {
            if (writing_on == true)
            {
                fwrite(buffer, sizeof(BYTE)*512, 1, img);
            }
        }
        printf("%s\n", filename);
    }
    fclose(mcard);
    free(buffer);
    return 0;
}