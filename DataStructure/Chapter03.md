# {{ book.data_structure.chapter3.title }}
<!-- toc -->

## Stack 的定義, 製作與應用
---
### Define Stack
是一個具有**後進先出**(Last In First Out, **LIFO**)性質之有序串列，其中
- 插入元素: **push**
- 刪除元素: **pop**
且 push, pop **皆發生在同一端**，叫**頂端(top)**

### Applications of Stack
- 處理**副程式呼叫(subroutine call)**: Stack of **啟動紀錄(Activation Record)/程序框(Procedure Frame)**
- 處理**遞迴呼叫(recursive call)**: 類似於副程式呼叫
- 算術中
  - **中序**(**infix**: **LDR**)表示法轉**後序**(**postfix**: **LRD**)表示法或**前序**(**prefix**: **DLR**)表示法
  - **後序式計算**及**前序式計算**
- **編譯器文法剖析(compiler parsing)**
- **二元樹**的**前, 中, 後序追蹤(preorder, inorder, postorder)**
- 指令型式為 Zero-operand 的 Stack Computer 機器大部分用 push/pop 方式處理算術式
- 機器處理 Re-entrant Routine (pure procedure) supported by Stack in hardware.
> pure procedure: pure code, **functional programming**
- **圖形(Graph)**的**深度搜尋**(depth-first search, **DFS**)
- 資料反序輸出: 由小 $$ \rightarrow $$ 大 $$ \Leftrightarrow $$ 由大 $$ \rightarrow $$ 小
- 日常生活的例子: 自助餐廳取餐盤之行為
- 迷宮問題(maze problem)
- **迴文判斷(palindrome)**: 字串由左 $$ \rightarrow $$ 右 = 由右 $$ \rightarrow $$ 左，左右對稱

### Make Stack

#### by Array {#make-stack-by-array}
- `S: array[1 ... n] of items;`
- `top: int = 0;`

```c
push(S, item) {
    if (top == n) return "S is full.";
    else {
        top = top + 1;
        S[top] = item;
    }
}
```

$$ \rightarrow $$ Time: $$ \color{red}{\mathrm{O}(1)} $$

```c
pop(S) {
    if (top == 0) return "S is empty.";
    else {
        item = S[top];
        top = top - 1;
        return item;
    }
}
```

$$ \rightarrow $$ Time: $$ \color{red}{\mathrm{O}(1)} $$

#### by Linked List {#make-stack-by-linked-list}
- **節點(Node)**之結構如下:
```c
struct Node {
    int Data;              // 存資料
    struct Node *Next;     // 指向下一個 Node 之指標
}
```
- `top: pointer = Nil;` / `struct Node *top = NULL;`

