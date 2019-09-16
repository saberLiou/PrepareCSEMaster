# {{ book.operating_system.chapter1.title }}
<!-- toc -->

## Computer System Structure
- Users
> $$ ^{ex.} $$ human beings, other machines or systems
- Programs
  - System Programs: 幫助 programmer 的開發 service
  > $$ ^{ex.} $$ Compiler, Assembler, Linking Loader, Debugger, ...
  - Application Programs: 一般 user 的 service
  > $$ ^{ex.} $$ Text Editor, DBMS, Office, ...
- **Operating System**
- Hardware
> $$ ^{ex.} $$ CPU, Memory, I/O Devices, ...

![Computer System Structure](../images/OperatingSystem/Chapter01/computer_system_structure.jpg "Computer System Structure")

> - **裸機(Bare Machine)**: 純粹只有硬體組成，其上無任何 OS 及 System Programs
> - **伸延機器(Extended Machine)**: Bare Machine 上加入 OS/System Programs/Application Programs

## OS 之架構 (Structure)

## OS 之扮演角色 (Roles) 或目的
- 提供一個讓 Users 易於操作電腦之溝通介面
- 提供一個讓 Users Programs 易於執行之環境
- 作為一個資源(resource)的管理者，協調分配這些 resources($$ ^{ex.} $$ CPU, Memory, I/O, ...)，期望資源可以被有效利用，甚至公平使用
- 作為一個監督者，監控所有 Processes 執行，避免 Process 之有意或無意的破壞，造成 System 重大危害

## System Types

### 多元程式設計系統 (Multiprogramming System)
- Define: 系統允許多個 jobs(Processes) in the Memory 同時執行
  - 主要目的: **提高 CPU utilization**，避免 CPU idle
  - 作法: 透過 **Job Scheduling**(or **CPU Scheduling**) 技術達成  
    $$ ^{ex.} $$ 當執行中的 Process 在 waiting for I/O-completed 時，OS 可將 CPU 切換給另一個 Process 執行(**Context Switching**) $$ \Rightarrow $$ 只要系統內有夠多的 jobs 存在，CPU idle 的機率就會下降(CPU always busy.)
- **Multiprogramming Degree**: 存在於系統內執行的 Processes 數目  
  - 一般而言，Degree $$ \uparrow \Rightarrow $$ CPU utilization $$ \uparrow $$
  > 「**08. Virtual Memory**」之 **Thrashing** 狀況除外

- 多個 Processes 同時執行之兩種方式
  - **Concurrent(並行) Execution**: 一段時間內在**單顆 CPU(one core)** 上執行多個 Processes，但切成單位時間來看，每個單位時間內只會有一個 Process 執行

    ![Concurrent Execution](../images/OperatingSystem/Chapter01/concurrent_execution.jpg "Concurrent Execution")

  - **Parallel(平行) Execution**: 一段時間內在**多顆 CPUs(multiple cores)** 上同時執行不同的 Process

    ![Parallel Execution](../images/OperatingSystem/Chapter01/parallel_execution.jpg "Parallel Execution")

{% hint style='info' %}
True/False?
1.  Multiprogramming System 一定要 Multiprocessors(多顆 CPU) System 支持才行
2.  Multiprogramming System 一定要 Multiusers(多人) System 支持才行
{% endhint %}
> 1. False $$ \because $$ **Single CPU by Concurrent Execution** 也可以
> 2. False $$ \because $$ **Single-users System** 也可以

### 分時系統 (Time-Sharing System)
- Define: 又稱**Multitasking(多工) System**, It's **a logical extension of Multiprogramming System**(**Multiprogramming System 之一種**). CPU switches jobs **more frquently than Multiprogramming System**(恐龍本稱為**Batch System**) so that users can interact with each job while it's running, creating **interactive computing**. $$ \Rightarrow $$ 適合 **Interactions with users**
> $$ ^{ex.} $$ Mainframe 大型主機 $$ \leftrightarrow $$ 終端機群, Unix

- 強調:
  - response time 要短($$ ^{ex.} $$ < 1 second.)
  - 對每個 users job 要公平對待
  - 讓每個 users 覺得有自己專屬的 computer 之感覺

- 技術:
  - **CPU Scheduling** 採用 **RR(輪迴)排班**
  > 詳見「**04. Processes**」

  - 採用 **Swapping**，即 **Virtual Memory**
  > 詳見「**08. Virtual Memory**」

  - 採用 **Spooling**，讓每個 users 有自己的 I/O-device 之感覺，同時也**一併使用 Buffering**

### 多處理器系統 (Multiprocessors/Multicores System)

### 分散式系統 (Distributed System)

### 即時系統 (Real-Time System)

### 手持系統 (Handheld System, Mobile Computing)
