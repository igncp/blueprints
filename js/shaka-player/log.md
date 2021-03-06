# Shaka Player Log

These entries are in chronological order from bottom to top:

- Restructured the glossary. Before adding a flow and stack, searched for both types to add in the `todo.md`. Added flow for media source engine flush and stack for backoff attempt. It was a while since reviewing the project, first of all searched for new todos. After, when starting a transmuxer flow, learned more about `Uint8Array`, `DataView` and `ArrayBuffer`, which are closely related. Also read about `mux.js` which is from VideoJS.

- Created several flows from the TODOs. Also took a look at the unit tests for the main functions of the flows. Added an entry to the glossary. Created one stack and continued with the flows. Added a few stacks to the todo list. Also started to include the number of occurrences in the stacks. Started to review some of the opened and closed GitHub issues and learn about the labels. The reading helped to add some new glossary words. Learnt about `HTMLMediaElement.readyState`. Created a document to review merged PRs and closed issues. Also, read a post about EME extending the glossary.

- Read about source maps to better understand the `stats.py` parsing (e.g. using base64), and added the post to the resources. Listed the utils files in `lib` and gave a brief description of each one. Also overread the existing polyfills files and the mechanism to register them, listing the files in the `source.md` note. Added a section in the notes to add useful commands to work with the project. Added several TODOs to the flow.

- Added several entries to the glossary, tried to look information for several of the entries. Overread many manuals and specifications for the glossary. ISO provides the DASH spec for free. After adding some of these links to the resources started writing the flow to set up the unit tests for `StreamingEngine`. After writing both setups for the tests, overread a few unit and integration tests, although will read more after changing the topic. Created a summary of the contents of `build/stats.py` although the actual functionality is complex.

- Created shallow flow notes for the `Player` constructor and `load` method. Started overreading the tests for `StreamingEngine`, both unit and integration, comparing with the source, the plan being to select a few of the most important methods and add them to the TODO for creating diagrams, and connecting it to what I know from the `player` module too. I read about the `fakeEventLoop` from the test utils.

- Listed the current externs and Overread the extern generator: `build/generateExterns.js`. Read a few of the current issues, related to the desire to flatten the transition Points data structures in Dash which would be more similar to HLS. Also, overviewed the two projects that are ongoing at the moment, both refactor of the existing codebase that will facilitate more features. Reviewed a few of the existing users with the tag "Help Wanted".

- Read the FAQ and started the glossary. Read the most important methods of `lib/player.js` and pretend to write the flows as notes (added to TODO). Overread some media source files like `Playhead`, `PlayheadObserver` and `VideoWrapper`. Create a list of the engine entities in the source. Also created a new example in `code-gym` to log and expose many Shaka instances (e.g. Cue, DashParser, etc.).

- Read `test/test/boot.js` where it sets up all the tests. Overread `test/test/util/util.js` which defines generic utils. Also, overread the integration tests for the player. Start reading the actual unit tests for the player in `test/player_unit.js` while reading the implementation in `lib/player.js` (~3000 LOC).

- Built the local docs after installing the NPM deps. Also built the library (had to use Python2 or it would fail). When trying to run the tests, it needs to actually open the Chromium browser as it would use Karma. Tried to install Chrome to use HeadlessChrome for the tests. The unit tests worked but not integration, which seems to be due to my Arch setup.

- After cloning the repository from GitHub and noting down the commit SHA, started by creating a simple application in another repository, `code-gym`, where all the examples and small applications will be. Also started with the `structure.md` file adding the LOC information, and finding out what each top-level directory is for.
