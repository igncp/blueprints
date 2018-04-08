# Shaka Player Log

These entries are in chronological order from bottom to top:

- Created shallow flow notes for the `Player` constructor and `load` method.

- Listed the current externs and Overread the extern generator: `build/generateExterns.js`. Read a few of the current issues, related to the desire to flatten the transition Points data structures in Dash which would be more similar to HLS. Also, overviewed the two projects that are on going at the moment, both refactors of the existing codebase that will facilitate more features. Reviewed a few of the existing users with the tag "Help Wanterd".

- Read the FAQ and started the glossary. Read the most important methods of `lib/player.js` and pretend to write the flows as notes (added to TODO). Overread some media source files like `Playhead`, `PlayheadObserver` and `VideoWrapper`. Create a list of the engine entities in the source. Also created a new example in `code-gym` to log and expose many Shaka instances (e.g. Cue, DashParser, etc.).

- Read `test/test/boot.js` where it sets up all the tests. Overread `test/test/util/util.js` which defines generic utils. Also overread the integration tests for the player. Start reading the actual unit tests for the player in `test/player_unit.js` while reading the implementation in `lib/player.js` (~3000 LOC).

- Built the local docs after install the NPM deps. Also built the library (had to use Python2 or it would fail). When trying to run the tests, it needs to actually open the Chromium browser as it would use Karma. Tried to install Chrome to use HeadlessChrome for the tests. The unit tests worked but not integration, which seems to be due my Arch setup.

- After cloning the repository from GitHub and noting down the commit SHA, started by creating a simple application in another repository, `code-gym`, where all the examples and small applications will be. Also started with the `structure.md` file adding the LOC information, and finding out what each top level directory is for.
