- Projects: https://rime.im/code/
    - The projects which I am currently most interested in are `librime` (core in C++), `plum` (the configuration manager and schema), and `ibus-rime` (the Linux client).
    - There is also the [main website](https://github.com/rime/home) which is using [hexo](https://github.com/hexojs/hexo)

- Current research:
    - [./ibus-rime.md](./ibus-rime.md)
    - [./ibus.md](./ibus.md)
    - [./librime.md](./librime.md)
    - [./plum.md](./plum.md)

- One important third-party dependency is [`OpenCC`](https://github.com/BYVoid/OpenCC) (Open Chinese Connect) which allows transforming between simplified and traditional characters.

## Code

- It is important to add the linebreak when using `printf` or the string will not be logged until the line is full

### Language Specific

- For printing numbers with `printf` use `%u`
- Logs with C++ for `librime`, for `C` use `printf`:
    - Sample of a common log: `std::cout << "Some prefix: " << myString << std::endl;`
    - You can also replace one of the existing `librime` logs with `std::cout`
    - In some cases it will need to add this import: `#import <iostream>` if not already imported
- General explanations about `extern "C"`: https://stackoverflow.com/a/1041880
- The `Vector` class is used in multiple places, with these methods:
    - `push_back`: https://www.cplusplus.com/reference/vector/vector/push_back/
    - `back`: https://www.cplusplus.com/reference/vector/vector/back/

## Learnings

- [CMakeLists tutorial](https://web.archive.org/web/20141116113322/http://preetisblog.com/programming/how-to-write-cmakelists-txt)

## Links

Most of the content is using chinese with traditional characters

- [Wiki](https://github.com/rime/home/wiki)
- [Website](https://rime.im/)
- [Gitter](https://gitter.im/rime/home)
- [Issues](https://github.com/rime/home/issues)
