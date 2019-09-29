# {{ book.computer_organization.chapter6.title }}
<!-- toc -->

## 區域性原則 (Principle of Locality)   {#principle-of-locality}
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

## 不同的記憶體技術
$$ \because $$ 記憶體**容量** $$ \uparrow \Rightarrow $$ 找尋存取位址的**解碼時間** $$ \uparrow \therefore $$ 記憶體**速度** $$ \downarrow $$，不過幸好有 **[locality of reference](#principle-of-locality)**，因此可使用不同的大小與速度的記憶體組成**[階層式記憶體](#memory-hierarchy)**來達到容量大且速度快之需求，以下為三種主要的技術:
- **靜態隨機存取記憶體(Static Random Access Memory, SRAM)**
- **動態隨機存取記憶體(Dynamic Random Access Memory, DRAM)**

| 一位元的儲存細胞 | SRAM | DRAM |
|:-------------:|:----:|:----:|
| 1 bit storage | 兩個**反向閘(inverter)**形成 **latch** | 以電荷儲存於**需 refresh** 之**電容器(capacitor)** |
| **體積**       | **大** | **小** |
| 速度           | 快     | 慢     |

- **磁碟(Magnetic Disk)**

## 記憶體階層 (Memory Hierarchy)    {#memory-hierarchy}
目的: 讓使用者能用**最便宜的技術**來擁有足夠的記憶體，且利用最快的記憶體來提供**最快的存取速度**

| 技術 | 距離 CPU | 速度 | 容量 | $/bit |
|:-----------:|:-------:|:-----:|:----:|:-----:|
| SRAM        | 近 | 快 | 小 | 高 |
| DRAM        | $$ \downarrow $$ | $$ \downarrow $$ | $$ \uparrow $$ | $$ \downarrow $$ |
| 磁碟         | 遠 | 慢 | 大 | 低 |

![Memory Hierarchy](../images/ComputerOrganization/Chapter06/memory_hierarchy.jpg "Memory Hierarchy")
> 現行技術:
> - **Cache** Memory: **SRAM**
> - **Main** Memory: **DRAM**

### 區塊的命中與失誤
- 兩記憶體層次中最小的資料傳輸單位稱為**區塊(block)**或**行(line)**
- **命中(hit)**: CPU 可以在**層次較近**的記憶體中找到需要的資料
> 比率: **命中率(hit rate/ratio)**
- **失誤(miss)**: CPU 無法在層次較近的記憶體中找到需要的資料，需要至層次較遠的記憶體裡找尋包含此資料的區塊
> 比率: **失誤率(miss rate)** = 1 - hit rate
- **命中時間(hit time)**: CPU 用在**判斷命中或失誤** + **從層次較近的記憶體存取資料**的時間
> 其中大部分時間花在**資料存取**上
- **失誤懲罰時間(miss penalty)**: CPU 從**層次較遠的記憶體抓取失誤的區塊，載入層次較近的記憶體** + CPU 存取記憶體區塊裡的資料之時間
> 其中大部分時間花在**記憶體層次間的區塊抓取與載入**上

$$ \rightarrow $$ $$ \because $$ **層次距離 CPU 較近**的記憶體**容量小**且**存取速度快** $$ \therefore $$ **命中時間 << 失誤懲罰時間**
- **命中率夠高**:
  - CPU 存取資料的速度 = 層次距離 CPU **最近**之記憶體的存取速度
  - 記憶體的儲存容量 = 層次距離 CPU **最遠**之記憶體的儲存容量

## 直接對映快取記憶體 (Direct-mapped Cache Memory)  {#direct-mapped-cache-memory}
![Cache Access Main Memory](../images/ComputerOrganization/Chapter06/cache_access_main_memory.jpg "Cache Access Main Memory")

![Cache Access Main Memory with Valid Bit](../images/ComputerOrganization/Chapter06/cache_access_main_memory_with_valid_bit.jpg "Cache Access Main Memory with Valid Bit")
> **Main Memory** 如果是 **word addressing**, offset = **word(block)** offset.

### 快取記憶體位元的計算
考試時給:
- **Cache size**(**不包含 tag 欄位和 valid bit**): ? bytes = (? / 4) words $$ \, \text{------} \, \spadesuit $$
- **block size**: word(s) / block $$ \, \text{------} \, \clubsuit $$
- **address length**: ?-bits

Steps:
- **求 block 總數**: $$ \dfrac{\spadesuit}{\clubsuit} \, \text{------} \, \heartsuit $$ 
- **切位址**求 tag 欄位 bit 數 $$ \text{------} \, \diamondsuit $$
- [$$ 1 $$ + $$ \diamondsuit $$ + ($$ \clubsuit $$ **in bits**)] $$ \times \heartsuit $$
> $$ 1 $$: **valid bit**

### 區塊大小與快取失誤率
![Block Size with Miss Rate](../images/ComputerOrganization/Chapter06/block_size_with_miss_rate.jpg "Block Size with Miss Rate")

**減少失誤懲罰時間**之方法(CPU 皆無需等到距離層次較近的記憶體區塊的字組全部載入完才開始讀取):
- **儘早重新開始(early start)**: CPU 直到區塊中所需要的字組送到層次較近的記憶體裡時，才讀取該字組
> $$ ^{ex.} $$ 若**[直接對映快取記憶體](#direct-mapped-cache-memory)**之**第一張圖**裡 ** 9 號 block [36, 37, 38, 39]** 為四個字組，則 CPU 讀取 **38** 號字組之順序為:  
> 載入 36 $$ \rightarrow $$ 37 $$ \rightarrow $$ 38, CPU 讀取 $$ \rightarrow $$ 39
- **需要的字組先送(requested/critcal word first)**: CPU 所需要的字組會先從層次較遠的記憶體送到層次較近的記憶體裡並讀取，剩餘的字組才依序載入
> $$ ^{ex.} $$ 若**[直接對映快取記憶體](#direct-mapped-cache-memory)**之**第一張圖**裡 ** 9 號 block [36, 37, 38, 39]** 為四個字組，則 CPU 讀取 **38** 號字組之順序為:  
> 載入 38, CPU 讀取 $$ \rightarrow $$ 36 $$ \rightarrow $$ 37 $$ \rightarrow $$ 39

$$ \therefore $$ **速度**上: **儘早重新開始 > 需要的字組先送**