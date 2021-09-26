# Shaka Player Tooling

- First of all install NPM dependencies with `npm i`
- Building local docs: `./build/docs.py`
- **Important**: For some python scripts, Python 3 would not work, so must use the supported Python 2.7
- It has a node script to generate Google Closure externs files using Esprima, ~600 LOC: `build/generateExterns.js`
  - This uses a DFS (Depth First Sort) of the AST to filter the `require` and `provide` statements
  - The externs in the the repo are dynamically added in the `build/build.py` script

## Stats Script Flo

### Introduction

- There are four different outputs and in two of those it can output the data in DOT notation (graphviz)
- It parses the source map of the library
- For more info, there is a Stats section in `build/README.md` or in the help output from the script
- It can try to search the source map by using the passed type

Examples:

```
python2 build/stats.py dist/shaka-player.compiled.map -c | less
```
- The actual functionality to generate the stats seems complex and it will require time to understand
