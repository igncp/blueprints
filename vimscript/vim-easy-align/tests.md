# Tests

The repository uses `.vader` files. This framework is from the same person:
https://github.com/junegunn/vader.vim . These tests contain a `include`
directory with the setup of the tests and a `run` file to start the runner.

The `run` script is just opening Vim in a similar fashion as the `.travis.yml`
file.

Tree:

```
 ├── blockwise.vader
 ├── commandline.vader
 ├── extra.vader
 ├── fixed.vader
 ├── fixme.vader
 ├── include
 │   ├── setup.vader
 │   └── teardown.vader
 ├── interactive.vader
 ├── README.md
 ├── run
 └── tex.vader
```

The only two tests failing in the Docker environment are in the `vixme.vader`
file, which seems to imply that they are expected failures, although only 2 of
4 are failing.
