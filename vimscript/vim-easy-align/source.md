# Source

## `./pluglin/easy_align.vim`

- Contains a collection of script-scoped functions which are bound to key maps
- Two functions use the genric function: `s:generic_easy_align_op` which is in
  charge of calling the global functions
- `easy_align#align` is the main command (defined at the end of `./autoload/easy_align.vim`)

## `./autoload/easy_align.vim`

- The only exposed function `easy_align#.*` is `easy_align#align`
