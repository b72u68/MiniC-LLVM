struct s1 {
  int a;
  int b;
};

int main()
{
  s1 st = new(s1);
  st.a = 1;
  return st.a;
}
