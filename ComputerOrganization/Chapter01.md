# {{ book.computer_organization.chapter1.title }}
<!-- toc -->

## 基本概念
---
- 計算機組織:「軟體最硬，硬體最軟」
- 計算機的**命令(commands)**:
  - **低階**語言: **指令(instructions)**，為 CPU 可執行的最基本運算
  - **高階**語言: **敘述(statements)**，可由一或多條指令所構成
- **指令集(instruction set)**: 一部計算機所可執行的指令之集合
  - **精簡指令集**(Reduced Instruction Set Computing, **RISC**): **MIPS**, **ARM**, SPARC, DEC Alpha, HP PA-RISC, ...etc.
    - 以**CPU執行效率**為考量
  - **複雜指令集**(Complex Instruction Set Computing, **CISC**): **Intel 80x86**, IBM System/360, DEC VAX, Motorola 68000, ...etc.
    - 提供較強的複雜指令，構成**較佳的程式設計環境**以減輕 programmer 的負擔
    - 兼具基本指令
- **指令集架構(Instruction Set Architecture, ISA)**: 為了學習撰寫低階語言而所必須了解的基本硬體架構及指令集之合稱

###### Q&A
Prior to the early 1980's, machines were built with more and more complex instruction set, but why has there been a move to RISC machines away from complex instruction machines?
> 1. Since **early computers** had **limited memory capacities** and were **expensive**, having a **CISC** instruction set enabled performing **complex operations with very few instructions**.
> 2. **Writing a compiler to generate efficient code** easier: **RISC > CISC** architecture.
> 3. **Pipeline** easier: **RISC > CISC** instructions.

## MIPS (Microprocessor without Interlocked Pipe Stages)
---
- 課本使用: MIPS **R2000**
- **字組(word)**: ? bits(字組大小)的CPU一次可以處理的資料量，其一般目的暫存器(General Purpose Registers, GPR)與算術邏輯運算單元(Arithmetic Logic Unit, ALU)亦為 ? bits

## 內儲式程式概念 (Stored-Program Computer or Von Neuman Machine)
---
- 兩個主要建構原則:
  - **指令被表示成像數字一般的形式**，使程式能以二進制檔案的方式散佈，因此相容的指令集所造成的計算機便可共用一些現成的軟體
  - **要被執行的程式一定得先放置於記憶體中，像數字一般的被存取**
  
## 指令集架構: Hardware Information + Instruction Set
---
- 學習低階組合語言時所必須了解的**硬體資訊(Hardware Information)**應包含以下項目:
  - **記憶體(Memory)**
  - **暫存器(Register)**
  - **指令格式(Instruction Format)**
  - **定址模式(Addressing Mode)** 
- 計算機基礎架構(Basic Computer Structure)五個單元:
  - 控制單元(Control Unit)
  - 資料路徑(Datapath): ALU + Registers, 真正處理資料和執行指令之電路
    > **處理器(Processor)**: Control Unit + Datapath
  - 記憶體(Memory)
  - 輸入設備(Input Device)
  - 輸出設備(Output Device)

![Basic Computer Structure in ISA](../images/ComputerOrganization/Chapter01/basic_computer_structure.jpg "Basic Computer Structure in ISA")

### 記憶體 (Memory)
- 一個一維的大陣列: 位址(address) => 位元組(byte, 8 bits)
- **byte addressing** (32 bits Memory):

| address            |        |
|:------------------:|:------:|
| 0                  | 8 bits |
| 1                  | 8 bits |
| 2                  | 8 bits |
| ...                | ...    |
| $$ 2 ^ {32} - 1 $$ | 8 bits |

- **word addressing** (32 bits Memory):

| address             |        |        |        |        |
|:-------------------:|:------:|:------:|:------:|:------:|
| 0                   | 8 bits | 8 bits | 8 bits | 8 bits |
| 4                   | 8 bits | 8 bits | 8 bits | 8 bits |
| 8                   | 8 bits | 8 bits | 8 bits | 8 bits |
| ...                 | ...    | ...    | ...    | ...    |
| $$ 2 ^ {32}  - 4 $$ | 8 bits | 8 bits | 8 bits | 8 bits |

- **對齊(alignment)**: MIPS 裡所有字組都要從**位元組位址(byte address)為4的倍數**放起，如此一來 CPU 只要花一次存取時間便能自記憶體讀取一個指令或一個字組資料

#### 位元順序 (Byte-Order or Endianness)
- **Big Endian**:
  - 32-bits word 中**最左邊**或**最大位元組(Most Significand Byte, MSB)**被放置於**最低記憶體位置**
  - **MIPS**, IBM System/360, Motorola 68000, SPARC, HP PA-RISC, ...etc.
- **Little Endian**:
  - 32-bits word 中**最右邊**或**最小位元組(Least Significand Byte, LSB)**被放置於**最低記憶體位置**
  - **Intel 80x86**, **ARM**, DEC VAX, DEC Alpha, ...etc.

![Big & Little Endian](../images/ComputerOrganization/Chapter01/endianness.jpg "Big & Little Endian")

### 暫存器 (Register)
- CPU 裡儲存運算元的記憶元件，量少而資料存取快速
- MIPS 共有:
  - 特殊目的暫存器(Special Purpose Register, **SPR**) x **3**
    - **$Hi** & **$Lo**: **64-bits**暫存器，存放**乘法**運算的乘積**高($Hi)低($Lo)位元**和**除法**運算的**餘($Hi)和商($Lo)**
    - **$PC(程式計數器, Program Counter)**: **32-bits**暫存器，存放**下一個要被執行的指令所在的記憶體位址**
  - **32-bits**浮點數運算暫存器(Floating Point Register, **FPR**): **$f0 - $f32** x **32**
    - 存在 **Coprocessor1** 裡，又稱浮點運算器(Floaing Point Unit, **FPU**)
  - **32-bits**一般目的暫存器(General Purpose Register, **GPR**) x **32**

| type              | name      | number    | usage                   |
|:----------------- |:--------- |:--------- |:----------------------- |
| Assember related  | $at       | $1        | Preserved for Assembler |
| OS related        | $ko - $k1 | $26 - $27 | Preserved for OS        |
| Procedure call    | $vo - $v1<br>$a0 - $a3 | $2 - $3 | Values for results |
| Memory management | | | |
| Variables         | | | |


- **溢出暫存器(splling register)**: 將不常用的變數從暫存器放入記憶體
  - $$ \because $$ 程式裡使用的變數 > 暫存器數量 $$ \therefore $$ compiler 將常用變數存暫存器，其餘放記憶體，並 I/O by load & store 指令

###### Q&A
存取速度: 暫存器 > 記憶體，為何不多設計一些暫存器來存取變數?
> CPU 存取暫存器時需經解碼程序以指定所要的暫存器: 暫存器 $$ \uparrow $$  
> $$ \Rightarrow $$ 解碼時間 $$ \uparrow $$ $$ \Rightarrow $$ CPU的時脈週期(clock cycle time) $$ \uparrow $$ $$ \Rightarrow $$ CPU 執行效率 $$ \downarrow $$ $$ \Rightarrow $$ CPU 功率消耗 $$ \uparrow $$
