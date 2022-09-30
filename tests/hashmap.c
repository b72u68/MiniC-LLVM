//Result: -1
struct node {
    int key;
    int val;
    node next;
};

struct hashmap {
    int size;
    node arr[];
};

int mod(int a, int b) {
    return a - b * (a / b);
}

void set(hashmap h, int key, int val) {
    int idx = mod(key, h.size);
    node curr;
    for (curr = h.arr[idx]; (int)curr != 0; curr = curr.next) {
        if (curr.key == key) {
            curr.val = val;
            return;
        }
    }

    node n = new(node);
    n.key = key;
    n.val = val;
    n.next = h.arr[idx];

    node arr[] = h.arr;
    arr[idx] = n;
}

int get(hashmap h, int key) {
    int idx = mod(key, h.size);
    node curr;
    for (curr = h.arr[idx]; (int)curr != 0; curr = curr.next) {
        if (curr.key == key) return curr.val;
    }
    return -1;
}

void del(hashmap h, int key) {
    int idx = mod(key, h.size);
    node curr;
    if (h.arr[idx].key == key) {
        node arr[] = h.arr;
        arr[idx] = h.arr[idx].next;
    }
    for (curr = h.arr[idx]; (int)(curr.next) != 0; curr = curr.next) {
        if (curr.next.key == key) {
            curr.next = curr.next.next;
            return;
        }
    }
}

int main() {
    hashmap h = new(hashmap);
    h.size = 5;
    h.arr = new(node[5]);

    set(h, 13, 2);
    set(h, 5, 19);
    set(h, 3, 5);
    set(h, 2, 10);

    del(h, 13);

    return get(h, 13);
}
