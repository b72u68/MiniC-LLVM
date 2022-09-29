struct s {
    int a;
    char b;
    bool c;
};

void void_func() {
    return;
}

int main() {
    (void)0;
    (void)'a';
    s st = new(s);
    (void)st;
    (int)void_func();
    return 0;
}
