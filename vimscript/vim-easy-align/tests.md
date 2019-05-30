# Tests

The repository uses `.vader` files. This framework is from the same person:
https://github.com/junegunn/vader.vim . These tests contain a `include`
directory with the setup of the tests and a `run` file to start the runner.

Seems all the tests in a `.vader` file start with the same `Given` result,
unless there are more `Given` afterwards.

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

## Comments

### `commandline.vader`

#### `different regular expression` L94

Here it uses the `'lm'` and `'rm'` options (margin left and right) which allow
to indent with other characters instead of with spaces. However, in other tests
it also seems possible to pass either `l` or `r` with a number, which is not a
known option, but a mode label. 

#### `Expect javascript`L129

It uses the shorthand notation for `ignore_unmatched` (`iu`), setting it to `0`
in the command. I don't currently understand why it aligns everything after the
end of the longest comment.

Seems when passing `iu`, if there is a line longer than other matched
delimeter, it will use it as reference. Note that the delimiter in this test is
`:`.

#### `Expect javascript`L165

This shows that when using `ig["String"]` it would still format the source code
delimeters but not the ones wrapped in quotes.

### `interactive.vader`

These tests have many useful examples. Can clearly show the difference between
left-align, center-align and right-align, which is applied to the delimeter.
