# {{ book.linear_algebra.chapter3.title }}
<!-- toc -->

## 3-1. 向量空間
---
### Define
$$ V \ne \emptyset $$, $$ F: field $$, 定義二運算
- 向量加法(vector addition): +
- 純量積(vector multiplication): $$ \cdot $$

> $$ V $$: 向量的集合; $$ F $$: 純量的集合，非 $$ R $$ 即 $$ C $$

滿足以下十個公設:
- (1) $$ \forall \vec{u}, \vec{v} \in V, \vec{u} + \vec{v} \in V $$
- (2) $$ \forall c \in F, \forall \vec{v} \in V, c\vec{v} \in V $$
> (1) **向量加法**的**封閉性**  
> (2) **純量積**的**封閉性**
- (3) $$ \forall \vec{u}, \vec{v} \in V, \vec{u} + \vec{v} = \vec{v} + \vec{u} $$
- (4) $$ \forall \vec{u}, \vec{v}, \vec{w} \in V, (\vec{u} + \vec{v}) + \vec{w} = \vec{v} + (\vec{u} + \vec{w}) $$
- (5) $$ \exists \vec{0} \in V $$ s.t. $$ \forall \vec{v} \in V, \vec{v} + \vec{0} = \vec{v} $$
- (6) $$ \forall \vec{v} \in V, \exists (-\vec{v}) \in V $$ s.t. $$ \vec{v} + (-\vec{v}) = \vec{0} $$
> **向量加法**的:  
> (3) **交換性**  
> (4) **結合性**  
> (5) **單位元素**  
> (6) **反元素**
- (7) $$ \forall c \in F, \forall \vec{u}, \vec{v} \in V, c(\vec{u} + \vec{v}) = c\vec{u} + c\vec{v} $$
- (8) $$ \forall c, d \in F, \forall \vec{v} \in V, (c + d)\vec{v} = c\vec{v} + d\vec{v} $$
- (9) $$ \forall c, d \in F, \forall \vec{v} \in V, c(d\vec{v}) = (cd)\vec{v} $$
- (10) $$ \forall \vec{v} \in V, 1 \cdot \vec{v} = \vec{v} $$
> **純量積**的:  
> (7) **向量加法分配性**  
> (8) **純量加法分配性**("+": 第一個為**純量加**, 第二個為**向量加**)  
> (9) **乘法結合性**  
> ，與  
> (10) **單位純量積**的**不變性**

則稱 $$ V $$ 為佈於 $$ F $$ 的向量空間(vector space over $$ F $$)，有時會將 $$ V $$ 記作 $$ (V, +, \cdot ) $$ 以強調其運算符號