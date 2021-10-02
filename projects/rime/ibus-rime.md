# ibus-rime

- Reviewed SHA: `d525f18`
- Not many loc, around 1000 of code (including header files), all in C (no C++)
- This wiki page talks about how to use this package:
    - https://github.com/rime/home/wiki/RimeWithIBus
- The IBus project, the main dependency of this rime repo, has a wiki in Github which is mostly in English
    - There is a special guide for creating new engines: https://github.com/ibus/ibus/wiki/Develop
- Some of the commits date from 2011
- It uses several APIs from `glib` like `glib-object`

## Infra

- In `package/make-package` it uses `git archive` in order to generate a tar file
- It uses [cmake](https://linux.die.net/man/1/cmake) to setup the project build
- [x] Manage to run a local build of `ibus-rime` and see the logs from it
    - [`./scripts/run_ibus_rime.sh`](./scripts/run_ibus_rime.sh)

## Code

- The main loop function from IBus is `ibus_main`
- Many core structs come from `librime/src/rime_api.h`, for example: `RimeConfig` or `RimeTraits`

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
- It looks like the `librime` api may be able to have more than one session at the same time. It exposes a function to find a session with a session id.
- `Composition` seems to represent the current menu item focused (the menu can have more items)
    - The `GetPrompt` method returns the header in the top, e.g. `〔方案選單〕`
    - The `GetCommitText` is related to focused option text, but not exactly the same
- CMake creates a file called `install_manifest.txt` inside the build directory.
    - It contains the paths of the files installed, and it can be used to uninstall a package by removing them.
    - https://stackoverflow.com/a/33295789

## Special options in switcher

- "simplification"
    - Related to this file `librime/src/rime/gear/simplifier.cc` which is a Filter and TagMatching
- "ascii_mode"
    - This is used by several files inside the `gear` module: chord_composer (Processor), key_binder (Processor), ascii_composer (Processor), ascii_segmentor (Segmentor)
- "full_shape":
    - Related to `librime/src/rime/gear/shape.cc` (a Formatter and a Processor) and `librime/src/rime/gear/punctuator.cc` (a Processor, Segmentor and Translator)
- "ascii_punct"
    - Related to `librime/src/rime/gear/punctuator.cc` (Processor)

All of these, and more, are registered in `librime/src/rime/gear/gears_module.cc` to be used by the Switcher

- In the `gears` module there are a few types of items registered: filters, processors, segmentors, translators, and formatters
- The `Processor` class is just in a header file and doesn't have an implementation

## Hotkey Menu: Switcher

- Where is pressing `F4` (options to change the character type, or en to zh) handled? Where is it saved? Special handler for the 2nd row? Where are the characters from?
    - Confirmed that when pressing `F4` it calls `Switcher::ProcessKeyEvent` which calls `Switcher::Activate`
        - Confirmed that at least when clicking one of the special options (e.g. from simplified to tranditional) it calls `Switcher::OnSelect` and it goes inside the `if` condition to apply the command
        - By printing `command->keyword()` is more clear which `SwitcherCommand` is selected, for example: `"simplification"`
    - When selecting an option, it calls `Context::GetSelectedCandidate`
        - The context gets uses a private `composition_` property which is `Segmentation` (a vector of `Segment`)
        - The `Segment` class also has the method `GetSelectedCandidate` which returns a `Candidate`

- Extra info
    - One of the key parts looks to be `librime/src/rime/lever/switcher_settings.cc` as this part is named `switcher`
        - It gets the hotkeys (e.g. `F4`) from the YAML configuration file
    - Another important class is `librime/src/rime/switcher.cc`
        - During `Switcher::InitializeComponents` it initializes 2 translators and 2 processors with my current setup
        - In the constructor method it uses the `Context` instance to listen for when a candidate is selected to call a callback (`OnSelect`)
    - The util to change characters type (simplified, tranditional), using OpenCC, is related to the `simplifier.h`
        - It uses the `librime` registry class, which uses the singleton pattern and only exposes one instance
        - The `Switcher` class has the concept of command, that I am guessing is one of the rows

## Doubts resolved

- [x] How is the font size configuration applied in rime UI
    - The UI for configuring the font size is from IBus and not rime

- [x] There are a few files with the `.in` extension but I don't know what is the reason
    - The `.in` doesn't seem to be a standard extension but I guess it means "input"
    - They are used inside `CMakeLists.txt` to convert them into the final files (without `.in` suffix)
    - The builtin function parsing them is [`configure_file`](https://cmake.org/cmake/help/latest/command/configure_file.html)
        - It also passes the `@ONLY` variable which means that inside those files all the variables will be of the format: `@FOO@`

- [x] How to edit the candidate options texts displayed in the GUI
    - The function giving color to the texts is [`ibus_text_append_attribute`](https://ibus.github.io/docs/ibus-1.5/IBusText.html#ibus-text-append-attribute), by choosing the index where the pronunciation starts
    - The numbers on the left are added with `ibus_lookup_table_set_label` and called `label`
    - The rest of the candidate (including the character and the pronunciation) is called `cand_text`

## Doubts

- [ ] How is `ibus-rime` connected and used by `ibus`
    - The XML file is installed under: `/usr/share/ibus/component/rime.xml`, from the `CMakeLists.txt` and `Makefile` files
    - Inside the XML it describes which executable to use, `/usr/lib/ibus-rime/ibus-engine-rime --ibus` in this case

- [ ] How to change the icon used by rime
    - The `.png` image is saved in the `icons` directory and copied by `cmake` during install

- [ ] Why some functions defined in `rime_engine.c` (below `functions prototype` comment) seem not implemented or used
    - On the commit when adding these functions, they were used by referencing them into one engine, but seems they are unused now
    - Maybe for backwards compatibility?
    - Many of them are implemented and used, however found `ibus_rime_engine_cursor_down` which isn't

- [ ] : __Move it to a flow__. What is the flow when IBus is enabled and a user types something in the keyboard
    - Seems starting in `ibus_rime_engine_process_key_event` from `rime_engine.c`
    - It is added to the engine generated by a macro from IBus repo: `IBUS_ENGINE_CLASS`
    - From `ibus-rime` the key is passed to `librime` by using `rime_api->process_key`, also passing the session id plus key modifiers like the `shift` key
        - The api delegates processing the key to the session instance
    - Also from `ibus-rime`, there is a lot of updates in `ibus_rime_engine_update`, some of them involve updating the UI in IBus
        - It updates the IBus icon and label UI by using a status struct from the `librime` api
        - It handles the current input by using the commit, which seems to mean that the user pressed enter
        - There is a variable called `inline_text` which is a `IBusText` struct, and contains the text that hasn't been commited yet

## Links

- [Repo](https://github.com/rime/ibus-rime)
