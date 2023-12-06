#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    // 1. Check if a file was passed as an argument:
    if (argc != 2)
    {
        printf("Usage: ./recover card.raw");

        return 1;
    }

    // 2. Read the file:
    FILE *in_file = fopen(argv[1], "r");

    // 3. Check if the provided filename exists and is loaded. If not, error:
    if (in_file == NULL)
    {
        printf("Could not open file");

        return 1;
    }

    // 4. Create an array with a size of 512:
    unsigned char temp_image_storage[512];

    // 5. Define an image counter to cover each image in the file, even if there is just one:
    int image_counter = 0;

    // 6. Create a placeholder for an outputted file:
    FILE *out_file = NULL;

    // 7. Allocate memory to place the file content into:
    char *filename = malloc(8 * sizeof(char));

    // 8. Process 512 bytes from in_file and store on the temp_image_storage variable:
    while (fread(temp_image_storage, sizeof(char), 512, in_file))
    {
        if (temp_image_storage[0] == 0xff && temp_image_storage[1] == 0xd8 && temp_image_storage[2] == 0xff &&
            (temp_image_storage[3] & 0xf0) == 0xe0)
        {
            sprintf(filename, "%03i.jpg", image_counter);

            if (out_file != NULL)
            {
                fclose(out_file);
            }

            out_file = fopen(filename, "w");

            image_counter++;
        }

        // 9. Check if the out_file has content present and if so, write the file out:
        if (out_file != NULL)
        {
            fwrite(temp_image_storage, sizeof(char), 512, out_file);
        }
    }

    fclose(out_file);
    fclose(in_file);

    free(filename);

    return 0;
}
