Adapted from Oskar Wickström's [The Monospace Web](https://owickstrom.github.io/the-monospace-web/) (code from https://github.com/owickstrom/the-monospace-web).

Usage:
- install pandoc (https://pandoc.org/)
- run the following command in terminal of your choice:

```
pandoc --toc -s --css reset.css --css index.css -i index.md -o index.html --template=template.html
```

- OR run ```convert_all.sh```, which compiles all markdown documents at once (except readme.md)