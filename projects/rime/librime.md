# librime

## Code

- It uses `RIME_STRUCT` definition to standarize the way of allocating structs
- Traits are configuration options passed when setting up or initializing the main api struct
- The main code directories are:

```
librime/src
librime/src/rime
librime/src/rime/dict
librime/src/rime/lever
librime/src/rime/config
librime/src/rime/gear
librime/src/rime/algo
```

### Building blocks

- To make the library modular: `Component` and `Registry` (for components)
- In `src/rime/component.h` it defines a meta class `Class` which is used by multiple files
    - It also defines an static `Require` method to retrieve items from a register
- Some idioms such as `an`, `the`, `of` appear very often and are just syntastic sugar
    - They are defined in `librime/src/rime/common.h`
- `Deployer` is an important class and used extensively in the api, it can run or schedule tasks
    - There is a CLI frontend for this class functionality also in `librime`
- There is a `Service` class, with the singleton pattern, which also contains a `Session` class in the same file

## Misc

- The api provides the `RIME_REGISTER_CUSTOM_MODULE` macro, which is also used internally in the `levers` module
- In `librime/tools/rime_deployer.cc` there is a comment that describes three directories: `user_data_dir` (the one in `~/.config`), `shared_data_dir` (the one in `/usr/share`) and others
- The file `librime/tools/rime_deployer.cc` is the definition for the `rime_deployer` command
- One of the project's dependencies is `Boost C++` which is a collection of open source libraries with utilities that complement C++ standard library
    - According to its docs, most of the libraries inside are `header-only`: https://www.boost.org/doc/libs/1_77_0/more/getting_started/unix-variants.html

## Doubts Resolved

- In the functions of the api, what is the difference between initialize and setup?
    - During the setup, it prepares the internal modules (`core`, `dict`, `levers`, and `gears`), and configures the logger with the levels from the arguments (traits)
    - During the initialization, it loads modules from the arguments (traits) and it also starts the `Service` instance

## Doubts

- N/A

## Unstructured

This library needs to be abstracted enough to support multiple platforms: Windows, Linux and macOS. Due to the nature of how input works, it needs to be asynchronous. Currently the component and registry setup looks cumbersome but it must be necessary to support the integration of external modules.
