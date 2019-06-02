# Redux Saga

- https://github.com/redux-saga/redux-saga
- Commit: 10fc193

## Resources

- https://github.com/redux-saga/redux-saga
- Website and docs: https://redux-saga.js.org/
- Tutorial Repository: https://github.com/redux-saga/redux-saga-beginner-tutorial
- Examples: https://github.com/redux-saga/redux-saga/tree/master/examples
- Collection of Articles and Links: https://redux-saga.js.org/docs/ExternalResources.html
- Glossary: https://redux-saga.js.org/docs/Glossary.html
- API: https://redux-saga.js.org/docs/api/
- Travis CI: https://travis-ci.org/redux-saga/redux-saga
- Gitter: https://gitter.im/yelouafi/redux-saga

- TS + Redux Saga: https://github.com/Lemoncode/redux-sagas-typescript-by-example

## Structure

The project is a monorepo using Lerna. It has 10 packages, with one named
`redux-saga` and another one called `core`. In the configuration file
`lerna.json` it indicates to use workspaces and to use yarn.

The top directories:

```
./.github: GitHub PR and issue templates
./build: For gitbook css
./docs: Gitbook markdown files and images
./examples: 7 example apps
./logo: Multiple resolutions and logos
./packages: Lerna packages
```

The Lerna packages:

```
babel-plugin-redux-saga: 'Adding the plugin improve logging for errors thrown in your sagas'
core: 'Saga middleware for Redux to handle Side Effects'
deferred: 'Helper for creating "exposed" promise object (with resolve & reject methods).'
delay-p: 'Promisified setTimeout'
is: 'Runtime type checking helpers'
redux-saga: Very minimal files that just re-rexport the core
simple-saga-monitor: Exports an object of functions. It has the comment: 'Export the `sagaMonitor` to pass to the middleware.'
symbols: 'Redux-saga internal symbol "registry"'
testing-utils: 'Redux-saga simple testing utils.'
types: Shared TypeScript types for the other packages. It only contains a `index.d.ts`, `package.json` and `README.md`
```

### Core

The main export is `src/internal/middleware.js`. This is the redux middleware.

## Glossary

- Channel [core's `middleware.js`]: Channels are mentioned in the advanced section of the guide but not sure yet if it is the same concept: https://redux-saga.js.org/docs/advanced/Channels.html

## Tests

Running `npm test` in the root would trigger the tests in all the packages (via
Lerna). All tests are passing locally and it takes relatively little to run
them (less than one minute). Core are just a small part of all so they are
fast. The tests are not inside `src`.

Tests are easy to follow and well structured. Seems that what you pass to
`middleware.run` is the saga. In one of the tests, a channel is created and the
`put` method is overridden. Also in the tests, it seems that the `channel` is
accessible from the store at the same level as `setState` or `dispatch`.

The tests within `interpreter/base` are quite informative about how the sagas
are executed. To test the TypeScript typings, it uses `typings-tester` which is
a rather unmaintaind package.

## Types

The TypeScript types contain many informative comments. The available
definition files:

```
./packages/core/effects.d.ts
./packages/core/index.d.ts
./packages/deferred/index.d.ts
./packages/delay-p/index.d.ts
./packages/is/index.d.ts
./packages/redux-saga/effects.d.ts
./packages/redux-saga/index.d.ts
./packages/symbols/index.d.ts
./packages/testing-utils/index.d.ts
./packages/types/index.d.ts
```

## Tooling

The project seems to be using:

- Rollup
- Lerna
- Yarn
- Jest

## Unstructured

In the first example of the GitBook they show the exposed API methods: `call`,
`put`, `takeEvery`, `takeLatest` (all from `'redux-saga/effects'`). They choose
to use Generators over promises / (async / await) due to the features they
provide like cancellation, and they expect to continue using them.

There is a concept of `rootSaga` (similar to `rootReducer`). The way to use it
is `sagaMiddleware.run(rootSaga)`. There are some examples of tests for sagas
where it uses the native syntax for generators: `.next()`.

The `takeEvery` function is one of the most common one and explained in the
beginning of the concepts docs. The docs uses the terminology: `task`,
`action`, `saga`. The "Effects" refer to the objects yielded by the generators.
The Sagas watch actions.

`call` is just a function that returns a plain object (like an action creator).
Alternatives to `call` are `apply` or `cps` (Continuation Passing Style). The
complete list of "declarative effects" is listed in the api:
https://redux-saga.js.org/docs/api/

A special case of declarative effect is `put`, which will write to the store.
`takeEvery` accepts the `'*'` wildcard which would listen to all the actions.
After, it mentions the `fork` declarative effect, which is non-blocking. In
this case, the yield returns a Tast object:
https://redux-saga.js.org/docs/api/index.html#task

### Core Implementation Reading

In the `middleware.js` file implementation there are several important
patterns. Uses `check` from `utils` along with `is` package for runtime
validations, taking into account Node's environment. It uses `sagaMonitor`
which I don't know yet. The main imports for this file are `runSaga` and
`channel`.

The `runSaga.js` file is more complex. It introduces the `./poc.js` file (now I
guess from 'process'), the `./scheduler.js` file, and it also uses `compose`
from `redux` to build the middleware. It uses the monitor passed via arguments.

The file `proc.js` is also complex, and uses the small `task-status.js` enum
which gives insight in the four possible states. Not clear what is the
difference between `CANCELLED` and `ABORTED`, probably related to error thrown.

Reading the typings, the concept of combinator effect (with `combinator: true`)
appears in the shared types.
