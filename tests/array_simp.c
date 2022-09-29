//Result: 3
struct s1 {
    int a;
    int b;
};

struct s2 {
    s1 c;
};

int main()
{
  s1 A[] = new(s1[3]);
  s1 st1 = new(s1);
  st1.a = 1;
  st1.b = 2;
  A[2] = st1;
  return A[2].a + A[2].b;
}
