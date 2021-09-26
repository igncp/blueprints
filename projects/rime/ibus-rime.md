# ibus-rime

- Reviewed SHA: `d525f18`
- Not many loc, around 1000 of code (including header files), extrictly in C
- This wiki page talks about how to use this package from an user perspective:
    - https://github.com/rime/home/wiki/RimeWithIBus
- The IBus project, the main dependency of this rime repo, has a wiki in Github which is mostly in English
    - There is a special guide for creating new engines: https://github.com/ibus/ibus/wiki/Develop
- Some of the code dates from 2011
- It uses several APIs from `glib` like `glib-object`

## Infra

- In `package/make-package` it uses `git archive` in order to generate a tar file
- It uses [cmake](https://linux.die.net/man/1/cmake) to setup the project build

## Code

- The longterm function running is `ibus_main`
- Many core structs come from `librime/src/rime_api.h` like for example: `RimeConfig` or `RimeTraits`

- `rime_main.c`
    - It registers a callback for `SIGTERM` and `SIGINT` signals
    - It saves the rime api (provided by `librime`) in a global pointer using the `RimeApi` struct

### Flows

- Entry Point:
    1. Register termination callbacks
    1. Set a global pointer using the `librime` api object
    1. Initialize and check status for `ibus` and `libnotify`
    1. Create the configuration options for `librime` and pass them to the api's setup function
    1. Initialize rime
    1. Run ibus main-loop function
    1. Cleanup variables

## Misc

- It has a `.gitattributes` file for ignoring some directories (git submodules) when running `git archive`
- `__declspec` is an api for windows
- The `ibus` repository is bigger than `ibus-rime` or `librime`, it has ~90k loc of C (including headers) and ~15k loc of Python
- In the `cmake` configuration there is a list of paths to extract rime data:
    - `/usr/share/rime-data` exists in my setup, however, in my previous experience it uses `~/.config/ibus/rime/` which is not listed there

## Links

- [Repo](https://github.com/rime/ibus-rime)
- [IBus Arch docs](https://wiki.archlinux.org/title/IBus)
- [IBus repo](https://github.com/ibus/ibus)
- [IBus wiki](https://github.com/ibus/ibus/wiki/ReadMe)
    - [Reference](https://ibus.github.io/docs/ibus-1.5/ch01.html)

## Doubts

- There are a few files with the `.in` extension but I don't know what is the reason
