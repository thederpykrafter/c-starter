#include <stdio.h>
#include <string.h>

// Define a structure for color key-value pairs
typedef struct {
    const char *name;
    const char *ansi;
} Color;

// Define an array of color key-value pairs
const Color colors[] = {
    {"black", "\x1b[30m"},
    {"red", "\x1b[31m"},
    {"green", "\x1b[32m"},
    {"yellow", "\x1b[33m"},
    {"blue", "\x1b[34m"},
    {"magenta", "\x1b[35m"},
    {"cyan", "\x1b[36m"},
    {"white", "\x1b[37m"},
    {"bright_black", "\x1b[90m"},
    {"bright_red", "\x1b[91m"},
    {"bright_green", "\x1b[92m"},
    {"bright_yellow", "\x1b[93m"},
    {"bright_blue", "\x1b[94m"},
    {"bright_magenta", "\x1b[95m"},
    {"bright_cyan", "\x1b[96m"},
    {"bright_white", "\x1b[97m"}
};

// Define the reset color code
const char *reset = "\x1b[0m";

// Function to print colored text using color name
void printc(const char *color_name, const char *text) {
    // Find the color code based on the color name
    for (size_t i = 0; i < sizeof(colors) / sizeof(colors[0]); i++) {
        if (strcmp(color_name, colors[i].name) == 0) {
            printf("%s%s%s", colors[i].ansi, text, reset);
            return;
        }
    }
    // If color name is not found
    printf("Unknown color: %s\n", color_name);
}
