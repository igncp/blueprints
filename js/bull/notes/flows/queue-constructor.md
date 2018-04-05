# Queue Constructor

- Support for instantiating without requiring using the `new` keyword
- Overload arguments, also validating some cases, normalizing to an `opts` object
- Saves the name (1s argument) and generates a token with `uuid`
- Gets the Redis key prefix (defaulting to `bull`)
- Defines getters for `client`, `eclient` and `bclient` using the `lazyClient` construct
  - This construct adds a listener for the `error` event for the Redis client (not the actual queue)
  - It also creates the connection just at the moment of calling the getter, and just the first time of calling it
  - In the case of the type `client` it also reads the Lua scripts (async, without blocking)
  - When the read of these scripts has finished, the `queue.isReady()` returned promise would resolve
- If in the options `skipVersionCheck` is falsy, it gets the version of the running Redis and compares it to a hardcoded minimum value
- It initializes several settings
- It instantes `this.timers` using `TimerManager`
- Adds some methods with `.bind`
- Generates the static map of keys using the passed / default prefix, queue's name a key type
