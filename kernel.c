/* Notes to self:
 * - Video memory starts at 0xb8000 in protected mode
 * - The memory supports 25 lines and each line contains 80 ASCII characters
 * - First byte = ASCII value and second byte = attribute-byte, or formatting value
 */

void kmain(void) {
    const char *str = "Kernel";
    char *vidptr = (char*)0xb8000; 
    unsigned int i = 0, j = 0;

    // Clears the screen
    // There are 25 lines each of 80 columns and each column takes 2 bytes
    for (; j < 80 * 25 * 2; j+= 2) {
        vidptr[j] = ' ';
        // Attribute byte: light gray on black background
        vidptr[j + 1] = 0x03;
    }

    j = 0;

    // Writes string to video memory
    for (; str[j] != '\0'; j++, i += 2) {
        vidptr[i] = str[j];
        // Attribute byte: light gray on black background
        vidptr[i + 1] = 0x03;
    }

    return;
}