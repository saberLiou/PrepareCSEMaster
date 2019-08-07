# {{ book.linear_algebra.chapter3.title }}
<!-- toc -->

## 3-1. 向量空間
---
### Define Vector Space
$$ V \ne \emptyset $$, $$ F $$: $$ field $$, 定義二運算
- 向量加法(vector addition): +
- 純量積(vector multiplication): $$ \cdot $$

> $$ V $$: 向量的集合; $$ F $$: 純量的集合，非 $$ R $$ 即 $$ C $$

滿足以下十個公設:
- (1) $$ \forall \vec{u} $$, $$ \vec{v} \in V $$, $$ \vec{u} $$ + $$ \vec{v} \in V $$
- (2) $$ \forall c \in F $$, $$ \forall \vec{v} \in V $$, $$ c\vec{v} \in V $$
> (1) **向量加法**的**封閉性**  
> (2) **純量積**的**封閉性**
- (3) $$ \forall \vec{u} $$, $$ \vec{v} \in V $$, $$ \vec{u} $$ + $$ \vec{v} $$ = $$ \vec{v} $$ + $$ \vec{u} $$
- (4) $$ \forall \vec{u} $$, $$ \vec{v} $$, $$ \vec{w} \in V $$, ($$ \vec{u} $$ + $$ \vec{v} $$) + $$ \vec{w} $$ = $$ \vec{v} $$ + ($$ \vec{u} $$ + $$ \vec{w} $$)
- (5) $$ \exists \vec{0} \in V $$ s.t. $$ \forall \vec{v} \in V $$, $$ \vec{v} $$ + $$ \vec{0} $$ = $$ \vec{v} $$
- (6) $$ \forall \vec{v} \in V $$, $$ \exists $$ (-$$ \vec{v} $$) $$ \in V $$ s.t. $$ \vec{v} $$ + (-$$ \vec{v} $$) = $$ \vec{0} $$
> **向量加法**的:  
> (3) **交換性**  
> (4) **結合性**  
> (5) **單位元素**  
> (6) **反元素**
- (7) $$ \forall c \in F $$, $$ \forall \vec{u} $$, $$ \vec{v} \in V $$, $$ c $$($$ \vec{u} + \vec{v} $$) = $$ c\vec{u} $$ + $$ c\vec{v} $$
- (8) $$ \forall c $$, $$ d \in F $$, $$ \forall \vec{v} \in V $$, ($$ c $$ + $$ d $$)$$ \vec{v} $$ = $$ c\vec{v} $$ + $$ d\vec{v} $$
- (9) $$ \forall c $$, $$ d \in F $$, $$ \forall \vec{v} \in V $$, $$ c $$($$ d\vec{v}$$) = ($$ cd $$)$$ \vec{v} $$
- (10) $$ \forall \vec{v} \in V $$, $$ 1 \cdot \vec{v} $$ = $$ \vec{v} $$
> **純量積**的:  
> (7) **向量加法分配性**  
> (8) **純量加法分配性**("+": 第一個為**純量加**, 第二個為**向量加**)  
> (9) **乘法結合性**  
> ，與  
> (10) **單位純量積**的**不變性**

則稱 $$ V $$ 為佈於 $$ F $$ 的向量空間(vector space over $$ F $$)，有時會將 $$ V $$ 記作 ($$ V $$, +, $$ \cdot $$ ) 以強調其運算符號

### 常見的向量空間
---
#### 歐氏空間 (Euclidean space)
- **Define**: $$ V $$ = $$ F^n $$ = { ($$ x_1 $$, $$ x_2 $$, ..., $$ x_n $$) | $$ x_1 $$, $$ x_2 $$, ..., $$ x_n \in F $$ }
> ($$ x_1 $$, $$ x_2 $$, ..., $$ x_n $$): n-tuple
- $$ V $$ 上定義 + 及 $$ \cdot $$ : $$ x $$ = ($$ x_1 $$, $$ x_2 $$, ..., $$ x_n $$), $$ y $$ = ($$ y_1 $$, $$ y_2 $$, ..., $$ y_n $$), $$ \alpha \in F $$
  - $$ x $$ + $$ y $$ = ($$ x_1 $$ + $$ y_1 $$, $$ x_2 $$ + $$ y_2 $$, ..., $$ x_n $$ + $$ y_n $$)
  - $$ \alpha \cdot x $$ = ($$ \alpha x_1 $$, $$ \alpha x_2 $$, ..., $$ \alpha x_n $$)
- 當 $$ F $$ = $$ R $$ 或 $$ C $$ 時, 稱 $$ V $$ = $$ R^n $$ 或 $$ C^n $$ 為**實**或**複**歐式空間

#### 矩陣空間 (matrix space)
- **Define**: $$ V $$ = $$ F^{m \times n} $$ = { $$ A $$ | $$ A $$ 為 $$ m \times n $$ matrix }
- $$ V $$ 上定義 + 及 $$ \cdot $$ : 矩陣的加法與純量積
- $$ F^n $$ 有兩種觀點:
  - 行向量: $$ F^{n \times 1} $$
  - 列向量: $$ F^{1 \times n} $$
- 當 $$ F $$ = $$ R $$ 或 $$ C $$ 時, 稱 $$ V $$ = $$ R^{m \times n} $$ 或 $$ C^{m \times n} $$ 為**實**或**複**矩陣空間

#### 多項式空間 (polynomial space)
- **Define**: $$ V $$ = $$ P $$ = { $$ P $$ | $$ P $$ 為佈於 $$ F $$ 之 polynomial }, 有時記作 $$ P $$($$ F $$) 或 $$ F $$[$$ x $$]
> $$ P $$ : **函數即向量**，但不要試著根據其定義畫出空間的座標圖！
- $$ V $$ 上定義 + 及 $$ \cdot $$ : 多項式的加法與純量積, $$ \forall f $$, $$ g \in V $$, $$ \alpha \in F $$
  - ($$ f $$ + $$ g $$)($$ x $$) = $$ f $$($$ x $$) + $$ g $$($$ x $$)
  - ($$ \alpha f $$)($$ x $$) = $$ \alpha f $$($$ x $$)

  > $$ ^{ex.} p $$($$ x $$) = $$ 2 $$ + $$ 3x $$ + $$ 4x^2 $$; $$ q $$($$ x $$) = $$ 5 $$ - $$ 6x $$ + $$ 3x^2 $$ + $$ 4x^3 $$  
  > $$ \Rightarrow p $$($$ x $$) + $$ q $$($$ x $$) = $$ 7 $$ - $$ 3x $$ + $$ 7x^2 $$ + $$ 4x^3 $$  
  > $$ \Rightarrow 5 $$($$ p $$($$ x $$)) = $$ 10 $$ + $$ 15x $$ + $$ 20x^2 $$

#### _n_ 次多項式空間 (_n_-th polynomial space)
- **Define**: $$ V $$ = $$ P_n $$ = { $$ f \in P $$ | $$ \deg $$($$ f $$) $$ \le n $$ }, 有時記作 $$ P_n $$($$ F $$) 或 $$ F_n $$[$$ x $$]
> 不能是 "$$ \deg $$($$ f $$) = $$ n $$": $$ ^{ex.} p $$($$ x $$) = $$ 3 $$ + $$ x^2 $$; $$ q $$($$ x $$) = $$ 5x $$ - $$ x^2 $$  
> $$ \Rightarrow p $$($$ x $$) + $$ q $$($$ x $$) = $$ 3 $$ + $$ 5x $$, $$ \deg $$ = $$ 1 \ne 2 $$
- $$ V $$ 上定義 + 及 $$ \cdot $$ : 多項式的加法與純量積
- _n_ 次多項式空間為多項式空間之**子空間**

#### 函數空間 (function space)
- **Define**: $$ V $$ = $$ \mathcal{F} $$($$ D $$, $$ F $$) = { $$ f $$ | $$ f $$: $$ D \rightarrow F $$ function }
> 亦不要試著根據其定義畫出空間的座標圖！
- $$ V $$ 上定義 + 及 $$ \cdot $$ : 函數的加法與純量積
> $$ ^{ex.} p $$($$ x $$) = $$ 2x $$ + $$ \sin $$($$ x $$); $$ q $$($$ x $$) = $$ 5x $$ + $$ \sqrt{x} $$  
> $$ \Rightarrow p $$($$ x $$) + $$ q $$($$ x $$) = $$ 7x $$ + $$ \sin $$($$ x $$) + $$ \sqrt{x} $$

#### 連續函數空間 (space of continuous function)
- **Define**: $$ V $$ = $$ \mathcal{C} $$[$$ a $$, $$ b $$] = { $$ f $$ | $$ f $$: [$$ a $$, $$ b $$] $$ \rightarrow F $$ continuous function }
> [$$ a $$, $$ b $$]: $$ a $$ 至 $$ b $$ 之區間
- $$ V $$ 上定義 + 及 $$ \cdot $$ : 函數的加法與純量積

## 3-2. 子空間
---
### Define Subspace
($$ V $$, +, $$ \cdot $$ ): vector space,
- $$ W \subseteq V $$
- ($$ W $$, +, $$ \cdot $$ ): vector space

則稱 $$ W $$ 為 $$ V $$ 之子空間(subspace)

### Theorem of 子空間的充要條件
已知 $$ V $$: vector space, $$ W \subseteq V $$, $$ W \ne \emptyset $$, 則下列敘述等價:  
1. $$ W $$ 為 $$ V $$ 的子空間   
2. $$ \forall \vec{u} $$, $$ \vec{v} \in W $$, $$ \vec{u} $$ + $$ \vec{v} \in W $$  
3. $$ \forall c \in F $$, $$ \forall \vec{v} \in W $$, $$ c\vec{v} \in W $$
> 在 $$ W \subseteq V $$ 和 $$ W \ne \emptyset $$ 的條件下，只需驗證**向量加法**及**純量積**的**封閉性**即可**證明 $$ W $$ 為 $$ V $$ 的子空間**

4. $$ \forall c $$, $$ d \in F $$, $$ \forall \vec{u} $$, $$ \vec{v} \in W $$, $$ c\vec{u} $$ + $$ d\vec{v} \in W $$  
> Corollary of 2. & 3.

5. $$ \forall c_i \in F $$, $$ v_i \in W $$, $$ i $$ = $$ 1 $$, $$ 2 $$, ..., $$ k $$, $$ \displaystyle\sum_{i=1}^k c_i v_i \in W $$
> Corollary of 4.

### Square of R 的三型子空間
1. 原點: {($$ 0 $$, $$ 0 $$)} = { $$ \vec{0} $$ }: zero space $$ \rightarrow $$ **點**
> $$ \forall $$ vector spaces, $$ \exists $${ $$ \vec{0} $$ }

2. 過原點直線 $$ \rightarrow $$ **線**
> 若非直線，則不具**純量積封閉性**

3. $$ x-y $$ 平面: $$ R^2 $$ $$ \rightarrow $$ **面**
> $$ V $$ 為 $$ V $$ 的子空間

### Theorem of 兩子空間交集
$$ W_1 $$, $$ W_2 $$ are subspaces of $$ V $$, 則 $$ W_1 \cap W_2 $$ is a subspace of $$ V $$
> 1. $$ \subseteq $$
> 2. $$ \ne \emptyset $$
> 3. **封閉性**

###### proof: 
1. $$ W_1 \subseteq V $$ 且 $$ W_2 \subseteq V $$, 則 $$ W_1 \cap W_2 \subseteq V $$
2. $$ \because \vec{0} \in W_1 \cap W_2 $$, $$ \therefore W_1 \cap W_2 \ne \emptyset $$
3. $$ \forall c $$, $$ d \in F $$, $$ \forall \vec{u} $$, $$ \vec{v} \in W_1 \cap W_2 $$,  
$$ \because \vec{u} $$, $$ \vec{v} \in W_1 $$ 且 $$ W_1 $$ is a subspace of $$ V $$, $$ \therefore c\vec{u} $$ + $$ d\vec{v} $$ = $$ W_1 $$  
$$ \because \vec{u} $$, $$ \vec{v} \in W_2 $$ 且 $$ W_2 $$ is a subspace of $$ V $$, $$ \therefore c\vec{u} $$ + $$ d\vec{v} $$ = $$ W_2 $$  
$$ \therefore c\vec{u} $$ + $$ d\vec{v} $$ = $$ W_1 \cap W_2 $$

### 兩子空間聯集
$$ W_1 $$, $$ W_2 $$ are subspaces of $$ V $$, $$ W_1 \cap W_2 $$ **不一定**為 $$ V $$ 的 subspace

###### 反例: 
$$ V $$ = $$ R^2 $$ has two subsapces $$ W_1 $$ and $$ W_2 $$,  
- $$ W_1 $$ = { ($$ x $$, $$ 0 $$) | $$ x \in R $$ },
> $$ x $$ **軸**
- $$ W_2 $$ = { ($$ 0 $$, $$ y $$) | $$ y \in R $$ },
> $$ y $$ **軸**

but $$ W_1 \cup W_2 $$ is not a subspace of $$ V $$.
> $$ ^{ex.} $$ ($$ 1 $$, $$ 0 $$), ($$ 0 $$, $$ 1 $$) $$ \in W_1 \cup W_2 $$, but ($$ 1 $$, $$ 0 $$) + ($$ 0 $$, $$ 1 $$) = ($$ 1 $$, $$ 1 $$) $$ \notin W_1 \cup W_2 $$

### Theorem of 兩子空間聯集
$$ W_1 $$, $$ W_2 $$ are subspaces of $$ V $$, $$ W_1 \cap W_2 \Leftrightarrow W_1 \subseteq W_2 $$ or $$ W_2 \subseteq W_1 $$

### Define 和空間 (Sum Space)
$$ W_1 $$, $$ W_2 $$ are subspaces of $$ V $$, $$ W_1 $$ + $$ W_2 $$ = { $$ \vec{w_1} $$ + $$ \vec{w_2} $$ | $$ \vec{w_1} \in W_1 $$, $$ \vec{w_2} \in W_2 $$ }, 稱為 $$ W_1 $$, $$ W_2 $$ 之和空間(sum space)

### Theorem of 和空間為 V 的子空間
$$ W_1 $$, $$ W_2 $$ are subspaces of $$ V $$, 則 $$ W_1 $$ + $$ W_2 $$ is a subspace of $$ V $$

###### proof: 
1. $$ W_1 \subseteq V $$ 且 $$ W_2 \subseteq V $$, 則 $$ W_1 $$ + $$ W_2 \subseteq V $$
2. $$ \because \vec{0} $$ = $$ \vec{0} $$ + $$ \vec{0} \in W_1 $$ + $$ W_2 $$, $$ \therefore W_1 $$ + $$ W_2 \ne \emptyset $$
3. $$ \forall c $$, $$ d \in F $$, $$ \forall \vec{u} $$, $$ \vec{v} \in W_1 $$ + $$ W_2 $$,  
$$ \vec{u} $$ = $$ \vec{u_1} $$ + $$ \vec{u_2} $$, $$ \vec{u_1} \in W_1 $$, $$ \vec{u_2} \in W_2 $$  
$$ \vec{v} $$ = $$ \vec{v_1} $$ + $$ \vec{v_2} $$, $$ \vec{v_1} \in W_1 $$, $$ \vec{v_2} \in W_2 $$  
$$ \Rightarrow c\vec{u} $$ + $$ d\vec{v} $$ = $$ c $$($$ \vec{u_1} $$ + $$ \vec{u_2} $$) + $$ d $$($$ \vec{v_1} $$ + $$ \vec{v_2} $$) = ($$ c\vec{u_1} $$ + $$ d\vec{v_1} $$) + ($$ c\vec{u_2} $$ + $$ d\vec{v_2} $$) $$ \in W_1 $$ + $$ W_2 $$

### Define 四個基本子空間
$$ A \in F^{m \times n} $$, 
- **核空間(kernel of $$ A $$, nullspace, $$ N $$($$ A $$))**:
  - $$ ker $$($$ A $$) = { $$ \vec{x} $$: $$ n \times 1 $$ | $$ A\vec{x} $$ = $$ \vec{0} $$ }
  - **齊次解集**，收集 $$ A\vec{x} $$ = $$ \vec{0} $$ 之 $$ \vec{x} $$
- **行空間(column space)**:
  - $$ CS $$($$ A $$) = { $$ A\vec{x} $$: $$ m \times 1 $$ | $$ \vec{x} $$: $$ n \times 1 $$ }
  - 收集 $$ A\vec{x} $$ = $$ \vec{y} $$ 之 $$ \vec{y} $$
- **左核空間(left kernel of $$ A $$, left nullspace)**:
  - $$ Lker $$($$ A $$) = { $$ \vec{x} $$: $$ 1 \times m $$ | $$ \vec{x}A $$ = $$ \vec{0} $$ }
  - 收集 $$ \vec{x}A $$ = $$ \vec{0} $$ 之 $$ \vec{x} $$
- **列空間(row) space)**:
  - $$ RS $$($$ A $$) = { $$ \vec{x}A $$: $$ 1 \times n $$ | $$ \vec{x} $$: $$ 1 \times m $$ }
  - 收集 $$ \vec{x}A $$ = $$ \vec{y} $$ 之 $$ \vec{y} $$

> $$ ^{ex.} A =
\begin{bmatrix} 
    1 & 2 & 3 \\
    1 & 1 & 2
\end{bmatrix}
\begin{bmatrix} 
    ? \\
    ? \\
    ?
\end{bmatrix} = 
\begin{bmatrix} 
    0 \\
    0
\end{bmatrix}
$$ $$ \Rightarrow $$ $$ ker $$($$ A $$) $$ = \begin{Bmatrix}
\begin{bmatrix} 
    a \\
    a \\
    -a
\end{bmatrix} | a \in R
\end{Bmatrix} $$;

> $$ ^{ex.} B =
\begin{bmatrix} 
    1 & 2 & 0 \\
    1 & 2 & 0
\end{bmatrix}
\begin{bmatrix} 
    ? \\
    ? \\
    ?
\end{bmatrix} = 
\begin{bmatrix} 
    b \\
    b
\end{bmatrix}
$$ $$ \Rightarrow $$ $$ CS $$($$ B $$) $$ = \begin{Bmatrix}
\begin{bmatrix} 
    b \\
    b
\end{bmatrix} | b \in R
\end{Bmatrix} $$

