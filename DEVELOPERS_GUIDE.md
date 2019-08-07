# Developer's Guide

## Developing

### Writing

#### SUMMARY.md
- Cannot write `{{ book.[variables] }}`.

#### Gitbook Plugins
- `etoc`:
  - each header should be **unique string** on each markdown file.
  - only parse **header without katex syntax** for linking.
- `hints`:
  - only **hints with `info` & `danger` styles** are appearing correctly on both productions of [Github Pages][Github Pages Version] and [New Gitbook][New Gitbook Version].
  - **cannot use katex** inside `{% hint style='' %}``{% endhint %}`.
- `katex`: always wrapped double-dollar signs for **really required mathematical symbols or numbers** to split the whole line into **katex pieces** for mobile correct RWD website format.
> example:  
> **ax^2 + bx + c = d, for all x belongs to real number**  
> must be written by **katex syntax** as  
> $$ ax^2 $$ + $$ bx $$ + $$ c $$ = $$ d $$, $$ \forall x \in R $$
- `localized-footer`: already installed, ready to fill something in.

### Debugging
```bash
$ gitbook serve ./ docs
```
to launch a local debugging server in valid ready-to-deploy folder for [production on Github Pages][Github Pages Version].

## Deploying

```bash
$ gitbook build --no-live ./ docs
```
to avoid adding gitbook plugin livereload into online produciton, and then
```bash
$ git add .
$ git commit -m "[message]"
$ git push origin master
```

[Github Pages Version]: https://saberliou.github.io/PrepareCSEMaster/ "Github Pages Version"
[New Gitbook Version]: https://saberliou.gitbook.io/preparecsemaster/ "New Gitbook Version"