//Result: 42

int inc(int x) {
  return x + 1;
}

int dec(int x) {
  return x - 1;
}

struct fptr_s {
  int f(int x);
};

int main() {
  fptr_s fptr = new(fptr_s);
  if (4 < 6) {
    fptr.f = inc;
  } else {
    fptr.f = dec;
  }
  return fptr.f(41);
}
