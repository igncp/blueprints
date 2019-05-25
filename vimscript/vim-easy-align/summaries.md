# Summaries

`vim-easy-align` is composed by two main files: `plugin/easy_align.vim` and
`autoload/easy_align.vim`. The mappings are defined in the `plugin` one but the
main entry point and most of the functionality is defined in the `autoload`.

The codebase is small, based in integration tests, with several key features:

- Interactive mode (which can be live)
- Configuration points
- Backwards compatibility

It doesn't have dependencies and has extense usage of regular expressions.
