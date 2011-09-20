#import "hello.h"

// Definitions
int main () {
    int number1 = 40;
    int number2 = 2;
    int result = addNumbers(number1, number2);
    
    printf("Hello, world!\n");
    printf("%d + %d = %d\n", number1, number2, result);
    printf("My name is %s \n\n", name());
}

int addNumbers(int number1, int number2) {
    int result = number1 + number2;
    return result;
}

char *name () {
    return "Lars";
}