//Result: 1745

int main() {
  char str[] = new(char[22]);

  str[0]  = 'N';
  str[1]  = 'o';
  str[2]  = ' ';
  str[3]  = 'N';
  str[4]  = 'D';
  str[5]  = '-';
  str[6]  = 'A';
  str[7]  = 'r';
  str[8]  = 'r';
  str[9]  = 'a';
  str[10] = 'y';
  str[11] = 's';
  str[12] = ' ';
  str[13] = 'T';
  str[14] = 'o';
  str[15] = 'd';
  str[16] = 'a';
  str[17] = 'y';
  str[18] = ' ';
  str[19] = ' ';
  str[20] = ':';
  str[21] = '(';

  int total = 0;
  for (int i = 0; i < 22; i++){
    total = total + (int) (str[i]);
  }
  return total;
}
