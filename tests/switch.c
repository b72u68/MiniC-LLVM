int main() {
  int i = 0;
  switch (3) {
  case 5:
    i++;
  case 4:
    i++;
  case 3:
    i++;
  default:
    i++;
  case 2:
    i++;
    return i;
  case 1:
    i++;
  case 0:
    i++;

  }
  return i;
}
