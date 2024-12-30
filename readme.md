Adapted from Oskar Wickström's [The Monospace Web](https://owickstrom.github.io/the-monospace-web/) (code from https://github.com/owickstrom/the-monospace-web).

Usage:
- install pandoc (https://pandoc.org/)
- run the following command in terminal of your choice:
```
pandoc --toc -s --css data/reset.css --css data/index.css -i src/index.md -o data/index.html --template=data/template.html
```