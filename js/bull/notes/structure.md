# Structure

## Prod Dependencies

This are the current dependencies in the `package.json`

- bluebird: Promises
- cron-parser: Transforms cron expressions (e.g '*/2 * * * *') into meaningful objects
- debuglog: Logger utility
- ioredis: NodeJS Redis client
- lodash: General JS utilities
- semver: Helper functions and validations for versions following semver
- uuid: Fast UUID generator following a spec

Additional notes:

- The `README.md` file recommends using `cluster`, which seems from a different vendor, for multi-thread queues.

## Files Structure

- All the markdown files are in the top level, with ~2500 lines total
- Three single-file examples under `/examples`
- In `/lib`: ~2300 LOC of JavaScript and ~300 LOC of Lua
- The `/support` directory only contains three images and a Sketch file
- It uses `mocha` + `sinon` for tests, which are in a different directory `/test` than `/lib`

## API

- The main require exports a constructor: `Queue` which accepts a string as identifier for the first argument for the constructor, and can accept more arguments.
- `Queue` "inherits" from `EventEmitter` from `events`, so the instances will accept some events like `completed`
