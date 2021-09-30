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
- The session contains a `Engine` instance

## Infra

- For building the library in Linux:
    - `sudo pacman -S cmake boost gtest # install dependencies`
    - `make release # builds the library, takes around 10 minutes`
    - Had an issue already reported, where I had to update two source files in order to complete the build:
        - https://github.com/rime/librime/pull/476
        - However this solution didn't work for me, had to add: `#include <cmath>`
    - After completing the process, the artifacts are in `./build/lib/librime.so`, and it also has several commands in `./build/bin`
- There are several files with `.mk` extension which are used by the main `Makefile` for some specific commands, for example `xcode.mk`

## Misc

- The api provides the `RIME_REGISTER_CUSTOM_MODULE` macro, which is also used internally in the `levers` module
- In `librime/tools/rime_deployer.cc` there is a comment that describes three directories: `user_data_dir` (the one in `~/.config`), `shared_data_dir` (the one in `/usr/share`) and others
- The file `librime/tools/rime_deployer.cc` is the definition for the `rime_deployer` command
- Dependencies:
    - One is `Boost C++` which is a collection of open source libraries with utilities that complement C++ standard library
        - According to its docs, most of the libraries inside are `header-only`: https://www.boost.org/doc/libs/1_77_0/more/getting_started/unix-variants.html
    - Other one is `capnproto` which is a data format, similart to JSON but faster
    - This repo depends on `ibus.h` in a few files: main, engine and settings
        - One example of ibus function used is: `ibus_lookup_table_set_cursor_pos`: https://ibus.github.io/docs/ibus-1.5/IBusLookupTable.html

## Doubts Resolved

- [x] In the functions of the api, what is the difference between initialize and setup?
    - During the setup, it prepares the internal modules (`core`, `dict`, `levers`, and `gears`), and configures the logger with the levels from the arguments (traits)
    - During the initialization, it loads modules from the arguments (traits) and it also starts the `Service` instance

- [x] How does the GUI handle horizontal vs vertical layout for showing character candidates
    - There is a reference in `librime`'s changelog pointing to [this commit](https://github.com/rime/librime/commit/c498f71). The naming used is stacked vs linear candidates
    - The configuration is either `_linear` being `true` or `false`.
    - This value is used in `ProcessKeyEvent` method of the `Selector` class
    - This seems to be called from `librime/src/rime/engine.cc`  which loops instances of multiple classes, all of which implement `ProcessKeyEvent`
        - The session has an instance of the engine
        - The engine has an instance of the context (`librime/src/rime/context.cc`)
    - This part is only handling the direction of the focus when receiving the key event
    - In IBus, this property is called `orientation`, and in `ibus-rime` this is passed from a setting value:
        - `g_ibus_rime_settings.lookup_table_orientation`

## Doubts resolved

- [x] Where is the GUI of the candidates panel coming from
    - It can be that the GUI is not setup in rime and is coming from `ibus`, for example: `https://github.com/ibus/ibus/tree/master/ui`
    - IBus api exposes methods very related to the ui, for example: https://ibus.github.io/docs/ibus-1.5/IBusLookupTable.html
    - It is almost confirmed that all of the GUI is coming from IBus and is updated via `ibus-rime`

## Doubts

- What are the main modules of the library?

- [ ] What is the difference between a static build (`make librime-static`) and a normal one (`make release`)?
    - There are several different parameters, the most important seems to be: `-DBUILD_STATIC=ON`
    - Inside `CMakeLists.txt` the option description is `"Build with dependencies as static libraries"`
    - It doesn't look that using this option it would be easier to setup debugging
- [ ] What is a shadow candidate? You can see one reference in `src/rime/candidate.cc`
    - Inside `src/rime/candidate.h` there are a few classes that inherit from `Candidate`
        - SimpleCandidate, ShadowCandidate, and UniquifiedCandidate
    - It is used in the simplifier's method `Simplifier::PushBack`, which is called internally from `Simplifier::Convert`
    - It adds the ShadowCandidate to a received parameter of type  `CandidateQueue`
    - The key method of the Simplifier, which is implementing a Filter, is `::Apply`
        - This method is called by the menu for every filter received
        - The filters are passed from `src/rime/engine.cc` in `TranslateSegments`
    - It is also inherited by the class `SchemaAction` from `src/rime/gear/schema_list_translator.cc`
        - In the same file, the class `SchemaSelection` extends `SimpleCandidate` instead
    - In the `librime/src/rime/candidate.cc` file there is a `UnpackShadowCandidate` which uses the `item` member
- [ ] What are these classes representing: Menu, Segmentation, Composition, Ticket
- [ ] How to enable logging for `librime` while running `ibus-rime`?

## Unstructured

This library needs to be abstracted enough to support multiple platforms: Windows, Linux and macOS. Due to the nature of how input works, it needs to be asynchronous. Currently the component and registry setup looks cumbersome but it must be necessary to support the integration of external modules.

One approach to understand the source code better can be to read the tools first. For example there is one tool called `tools/rime_api_console.cc` which seems like a small REPL to run a few interactive commands. By reading and describing these tools better, can understand the underlying concepts while learning how to use them for better future debugging.

There are some methods that seem unused. One example is `GetGenuineCandidates`.
