unsigned int my_strlen(const char* str) {
    unsigned int length = 0;

    while(*str++ != '\0'){
        length++;
    }
    return length;
}