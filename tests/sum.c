//Result: 55

struct int_reducer {
  int reducer(int a, int b);
};

int reduce_int_array_to_int(int arr[], int arr_size, int_reducer reducer, int initial_value) {
    int value = initial_value;
    for (int i = 0; i < arr_size; i++) {
        value = reducer.reducer(value, arr[i]);
    }
    return value;
}

int sum(int a, int b) {
    return a + b;
}

int main()
{
  int_reducer sum_reducer = new(int_reducer);
  sum_reducer.reducer = sum;
  int A[] = (new(int[10]));
  for (int i = 0; i < 10; i++) {
      A[i] = i + 1;
  }
  return reduce_int_array_to_int(A, 10, sum_reducer, 0);
}
