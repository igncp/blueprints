# Shaka Player Tooling

- First of all install NPM dependencies with `npm i`
- Building local docs: `./build/docs.py`
- **Important**: For some python scripts, Python 3 would not work, so must use the supported Python 2.7
- It has a node script to generate Google Closure externs files using Esprima, ~600 LOC: `build/generateExterns.js`
  - This uses a DFS (Depth First Sort) of the AST to filter the `require` and `provide` statements
  - The externs in the the repo are dynamically added in the `build/build.py` script
