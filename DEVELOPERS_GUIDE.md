# Developer's Guide

## Installation
```bash
$ npm install -g gitbook-cli
```

## Developing

### Writing

#### SUMMARY.md
- Cannot write `{{ book.[variables] }}` in it.

#### Gitbook Plugins
- `etoc`:
  - each header should be **unique string** on each markdown file.
  - only parse **header without katex syntax** for linking.
  - when using **fenced code blocks with MIPS syntax highlight(\`\`\`mipsasm ... \`\`\`)** inside **blockquotes(> ...)**, make sure to **add `>` in front of each line of codes inside block** to let all the headers of toc(table of content) below generated successfully.
- `hints`:
  - only **hints with `info` & `danger` styles** are appearing correctly on both productions of [Github Pages][Github Pages Version] and [New Gitbook][New Gitbook Version].
  - **cannot use katex** inside `{% hint style='' %}` `{% endhint %}`.
- `katex`:
  - always wrapped double-dollar signs for **really required mathematical symbols or numbers** to split the whole line into **katex pieces** for mobile correct RWD website format.
  > example:  
  > **ax^2 + bx + c = d, for all x belongs to real number**  
  > must be written by **katex syntax** as  
  > $$ ax^2 $$ + $$ bx $$ + $$ c $$ = $$ d $$, $$ \forall x \in R $$
  - You can use [`\color{}`](https://katex.org/docs/supported.html#style-color-size-and-font "KaTex Supported Functions") syntax to **color words in markdown**. :art:
- `localized-footer`: already installed, ready to fill something in.
- `scripts`: In `"plugins": {}` of `book.json`, it should be placed below the plugins that need to override some javascript functionalities by customized scripts.

### Debugging
```bash
$ gitbook serve ./ docs
$ open http://localhost:4000
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