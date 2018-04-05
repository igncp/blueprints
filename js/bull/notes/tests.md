# Tests

- All the test files have the `test_` prefix
- There are specific ESLint (adding the `mocha` env) in the `/test` directory


To run single files, mocha does not allow overriding the glob in the `mocha.opts`. Either use `.only` (more powerful) in the top `describe` or this command:

```
cat test/mocha.opts | \
  grep  '-' > /tmp/bull-mocha; \
./node_modules/.bin/mocha \
  --opts /tmp/bull-mocha \
  test/TEST_FILE_NAME
```

- It uses `/test/utils.js` for some helper methods during the tests, like `buildQueue` instead of directly `new Queue`. This allows to keep track of the queues created by the tests and to clean up all of them during the `afterEach`
