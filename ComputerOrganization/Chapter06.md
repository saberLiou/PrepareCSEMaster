# {{ book.computer_organization.chapter6.title }}
<!-- toc -->

## 區域性原則 (Principle of Locality)
程式的執行在任何一個時間點只會存取一小部分的記憶體位址空間，又稱 **locality of reference**
- **時間區域性(temporal locality)**: 如果一個指令或資料被存取到，那麼它**很快又會**被存取到
> $$ ^{ex.} $$ **迴圈**中的指令或資料
- **空間區域性(spatial locality)**: 如果一個指令或資料被存取到，那麼它**位址附近的指令或資料**也會很快被存取到
> $$ ^{ex.} $$ **循序執行的指令**或**陣列**

> $$ ^{ex.} $$ Write a C program which exhibits the *temporal* and *spatial localities*.
```c
void clearArray(int array[], int size) {
    int i;
    for (i = 0; i < size; i++) {
        array[i] = 0;   // i: temporal locality; array: spatial locality
    }
}
```