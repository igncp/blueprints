## Misc

- `ibus-rime` uses several functions from `ibus.h` package
- Some concepts provided by IBus are:
    - IBusLookupTable: https://ibus.github.io/docs/ibus-1.5/IBusLookupTable.html
        - The panel where it displays which candidates can be selected
    - IBusProperty: https://ibus.github.io/docs/ibus-1.5/IBusProperty.html
        - It uses this via a container of props, but I don't understand yet what are props

- IBus also has the concept of engine, and probably for the engines inside `ibus-rime` and `librime` have a similar meaning

## Links

- [IBus Arch docs](https://wiki.archlinux.org/title/IBus)
- [IBus repo](https://github.com/ibus/ibus)
- [IBus wiki](https://github.com/ibus/ibus/wiki/ReadMe)
    - [Reference](https://ibus.github.io/docs/ibus-1.5/ch01.html)
