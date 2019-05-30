# Summaries

`vim-easy-align` is composed by two main files: `plugin/easy_align.vim` and
`autoload/easy_align.vim`. The mappings are defined in the `plugin` one but the
main entry point and most of the functionality is defined in the `autoload`.

The codebase is small, based in integration tests, with several key features:

- Interactive mode (which can be live)
- Configuration points
- Backwards compatibility
- Repeatable alignments

It doesn't have dependencies and has extense usage of regular expressions.

The flow depends if the mode is live or interactive or a simple command. The
simple way to describe it is:

- Configuration setup
- Calculate the changes to apply
- Apply changes
- Save command in order to repeat them
