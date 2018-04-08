# Shaka Player Structure

## General LOC

These is the summary of the lines of code for the whole repository:

- JavaScript: 55141
- Markdown: 6963
- Python: 1589
- CSS: 1128
- HTML: 373
- JSON: 150
- Bourne: 68

## Dirs Structure

These are the top level directories of the project:

- `build`: It contains mostly scripts (the mayority in Python) to build different parts of the application, like the docs, tests or the library 
- `demo`: This contains an HTML application showcasing several parts of the player. It doesn't work out of the box, the deps need to be installed
- `docs`: Many documentation files. When generating the API docs, the will be also placed here
- `externs`: A few JavaScript files. I think related with the Google Closure library
- `lib`: Source code for the library
- `test`: Tests for the library. Roughly twice the code than in `lib`
- `third_party`: JAR files for Closure features, like the compiler, linter and other deps

The repository has an `index.html` file that will redirect to the demo.
