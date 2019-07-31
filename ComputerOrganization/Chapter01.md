# {{ book.computer_organization.chapter1.title }}
<!-- toc -->

## 基本概念
---
- 計算機組織:「軟體最硬，硬體最軟」
- 計算機的**命令(commands)**:
  - **低階**語言: **指令(instructions)**，為CPU可執行的最基本運算
  - **高階**語言: **敘述(statements)**，可由一或多條指令所構成
- **指令集(instruction set)**: 一部計算機所可執行的指令之集合
  - **精簡指令集**(Reduced Instruction Set Computing, **RISC**): **MIPS**, **ARM**, SPARC, DEC Alpha, HP PA-RISC, ...etc.
    - 以**CPU執行效率**為考量
  - **複雜指令集**(Complex Instruction Set Computing, **CISC**): **Intel 80x86**, IBM System/360, DEC VAX, Motorola 68000, ...etc.
    - 提供較強的複雜指令，構成**較佳的程式設計環境**以減輕programmer的負擔
    - 兼具基本指令
- **指令集架構(Instruction Set Architecture, ISA)**: 為了學習撰寫低階語言而所必須了解的基本硬體架構及指令集之合稱

### Q&A
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
### Hardware Information
- 學習低階組合語言時所必須了解的硬體資訊應包含以下項目:
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

- 記憶體(Memory)
