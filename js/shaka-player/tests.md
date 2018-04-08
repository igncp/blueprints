# Shaka Player Tests

- The tests files end with either `_unit` or `_integration` and are organized by features
- To use HeadlessChrome it is required to install latest version of `karma-chrome-launcher`
- There are ~1400 tests
- Running tests with `ChromeHeadless` would run most of the tests correctly but not the last ~100, which would have timeouts. These are the integration tests and seems it is due to my Arch setup
- However, running only the unit tests (e.g. `./node_modules/.bin/karma start --settings '{"browsers": ["ChromeHeadless"]}' --quick`) would work

## Tests Setup

- It sets up the tests in `test/test/boot.js`
  - Creates a global function to get args from Karma
  - Updates `console.assert` and Google's Closure `assert`
  - Treats unhandled promises rejections as failures
  - It filters the tests to be run
  - Installs Shaka polyfills
  - Sets the Jasmine timeout
  - Sets the log level from Shaka
  - Handles tests using external resources, drm, and quarantined tests
  - Configures the AMD with some mocks
  - Applies tests delay if necessary
- In Karma, after the bootstrap file, it loads all the utils files, each adding to the namespace `shaka.test.*`
