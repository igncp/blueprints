# Source

## `./pluglin/easy_align.vim`

- Contains a collection of script-scoped functions which are bound to key maps
- Two functions use the genric function: `s:generic_easy_align_op` which is in
  charge of calling the global functions
- `easy_align#align` is the main command (defined at the end of `./autoload/easy_align.vim`)

## `./autoload/easy_align.vim`

- The only exposed function `easy_align#.*` is `easy_align#align`

Functions list:

- easy_align#align
- s:align
- s:alternating_modes
- s:build_mode_sequence
- s:echon
- s:echon_
- s:ignored_syntax
- s:interactive
- s:interactive_modes
- s:normalize_options
- s:parse_args
- s:parse_filter
- s:parse_nth
- s:shift_opts
- s:test_regexp
- s:trim
- s:update_lines

- **s:atoi**: Converts a string into an integer if it looks like a number
- **s:build_dict**: Called only from `s:process`, constructs the 'application
  state' with some defaults
- **s:ceil2**: Increases one if odd
- **s:compact_options**: Uses `s:shorthand` (dictionary with shorter version of the options keys)
- **s:do_align**: One of the most extense and complex functions. It receives
  the lines to align and iterates them.
- **s:exit**: Echoes a `ErrorMsg` with a message and throws exit
- **s:floor2**: Called only from `s:do_align`, it returns the passed number if
  multiple of 2 or decreases by one
- **s:fuzzy_lu**: Used by `s:normalize_options`. Tries to retrieve a key from
  the `s:known_options` map.
- **s:highlighted_as**: Retrieves information about the syntax (`:h synIDattr`)
  to check the name. Returns either `0` if not using the expected syntax or `1`
  otherwise. Uses regex comparisons matching the case (`:h !~#`)
- **s:input**: Function to accept input from the user (`:h input`), called in
  many places. It handles the redraw (`:h redraw`) in a different way depending
  if in visual mode
- **s:ltrim**: Called from several places, performs a left-trim
- **s:parse_shorthand_opts**: Called only from `s:parse_args`, it parses the
  shorthand notation by using the `s:shorthand_regex`
- **s:process**: Is in charge of preparing the options and calling `s:do_align`
  to build the lines changes
- **s:rtrim**: Trim in the right
- **s:shift**: removes the first item (if not the only item) in a list. If the
  cycle option is passed, it appends it to the end of the list
- **s:split_line**: Called only from `s:do_align`, is a relatively long and
  complex function (with many arguments). It returns a list of tokens and a
  list of delimeters.
- **s:strwidth**: It maps to `strdisplaywidth` if exists. See `:h
  strdisplaywidth`
- **s:validate_options**: Loops the passed options and confirms the have the
  correct type (`:help type`). Called by `s:normalize_options`
- **s:valid_regexp**: It returns either `1` is regex is valid (does not throw
  on an empty string) or `0` if invalid

Important variables list:

- g:easy_align_last_command
- g:loaded_easy_align
- s:cpo_save
- s:easy_align_delimiters_default
- s:known_options
- s:live
- s:mode_labels
- s:option_values
- s:shorthand
- s:shorthand_regex

Important arguments types / meaning

- `s:process`:
    1. range: a tuple containing the first line and the last line numbers
    1. mode: One of 'r' | 'l' | 'c'. Not sure if also includes '*' and '**'
    1. n: String , I think it refers to the nth character to align (e.g. 1, 2, '*', '**')
    1. ch: String, it is the delimiter key (one of the keys of `s:easy_align_delimiters_default`)
    1. opts: a dict being a subset of `s:known_options`
    1. regexp: Seems boolean in this context, indicating if regexp present
    1. rules: dict that normally is `s:easy_align_delimiters_default` or an extension from it
    1. bvi: Boolean, true if block type visual mode (`:h visualmode()`) in
       opposition to line-type or character type

- `s:split_line`:
    1. line: String, I think the full line
    1. nth: Number
    1. modes: In this context, it is a string in the form `"[lrc...][[*]*]"` (l: left, r: right, c: center)
    1. cycle: Boolean
    1. fc: Number, First Column
    1. lc: Number, Last Column
    1. pattern: String (Regex). The `:h \/magic` behavour of regex is important to know here
    1. stick_to_left: Boolean
    1. ignore_unmatched: Boolean
    1. ignore_groups: Boolean
