# {{ book.computer_organization.chapter3.title }}
<!-- toc -->

## 效能 (Performance) 的定義
---
- 兩種衡量計算機效能的標準:
  - **反應時間(respone time)**:
    - 工作從開始到結束所花的時間，又稱**執行時間(execution time)**
    - 適用於**比較執行相同程式的兩部不同個人電腦**
  - **生產量(throughput)**:
    - 單位時間內所完成的工作量(job 數量)
    - 適用於**評比多人連線的伺服器**
- 以**執行時間**定義 computer X 之效能: $$ Performance_X $$ = $$ \dfrac{1}{\mathit{\text{Execution Time}}_X} $$
> computer X 的速度是 computer Y 的 n 倍: $$ \dfrac{Performance_X}{Performance_Y} $$ = $$ n $$

### Execution Time 的量測
- 流逝時間(elapsed time): 執行一個程式或完成一項工作的所需時間總量
  - 程式執行及等待 I/O 時間
    - Disk 和 Memory I/O
    - Input/Output I/O
    - 作業系統的開銷(Operating System overhead)
  - 處理器執行時間(CPU execution time)
  > 程式或工作使用 CPU 的時間，又稱處理器時間(CPU time)

    - 系統處理器時間(System CPU time)
    > CPU 執行作業系統的時間，為了服務使用者程式
    - **使用者處理器時間(User CPU time)**
    > CPU 執行使用者程式的時間，即**本章所量測的執行時間(execution time)**
    > - ~~absolute: wall clock time~~
    > - **relative: CPU clock**

### User CPU Time 的量測


## 影響 CPU 效能的因素
---

## 使用 MIPS 做為效能評估標準的謬誤
---

## Amdahl's 定律
---

## 效能總評
---

## 效能評估程式
---