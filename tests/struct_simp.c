struct s1 {
  int a;
  int b;
};

struct s2 {
  s1 c;
};

int main()
{
  s1 st1 = new(s1);
  st1.b = 2;
  s2 st2 = new(s2);
  st2.c = st1;
  return st2.c.b;
}
