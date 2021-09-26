# Bull - Log

This logs are in chronological order from bottom to top:

- Read the `MIGRATION.md` guide which describes the few differences between v2 and v3. Also read the small file `/lib/backoff.js` and the related patterns and tests.

- Tried to generate the same coverage locally. For that it is only necessary to use part of the `coveralls` script. After that added a new test for an uncovered part of the code for cases when passing file path handlers to `queue.progress`.

- Read through `/lib/timer-manager.js` which exposes the `TimerManager` class that uses `setTimeout` and keeps tracks of multiple listeners. The timers or `TimerManager` don't seem to have any tests. Also overread the `/lib/process/child-pool` and `lib/process/sandbox` that are used from the `Queue`.

- Ran several tests within `/test/test_queue.js` adding some `console.log` to inspect the data structures. After reading around 1/4 of the `/test/test_queue.js` first tests and tweaking the results, created the Queue's constructor flow note.

- Started reviewing the `/lib` and `/test` simultaneously, beginning with the queue which is one of the main exposed concepts. Learnt how to run the tests files individually with the same config by removing the glob from the `mocha.opts`. This starts to show some of the flows for queues, so added a few diagrams in TODO.

- Ran the tests. The tests require Redis to be running so they seem to be integration tests. It takes ~75 seconds to run all the tests. It also runs `eslint` before the tests by using the `pretest` script in the `package.json`. Read the `.travis.yml` configuration file and create a few notes for it.

- Overread the `REFERENCE.md` file to understand some basic methods and read all the examples in the `README.md` file. After, overread all the cases described in `PATTERNS.md`.

- First thing after cloning the repo is reading the dependencies for production and an overview of the dir structure, adding it to the notes. Also make some discoverability in the exposed API.
