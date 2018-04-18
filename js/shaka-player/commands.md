# Shaka Player Commands

These commands may not be specific to Shaka Player but they are useful while reviewing this project:

- Display public methods:

```
_fn() { ag 'prototype.[^_\n]*?=' $1 | less; } && _fn lib/FILE_PATH
```

- Display specific requires (e.g. here, all the google requires)

```
ag 'require\(.goog' lib/ --nonumbers --nofilename | grep . | sort | uniq
```
