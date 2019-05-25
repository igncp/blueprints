# Stacks

## `s:parse_nth`

1. Exposed `<Plug>(EasyAlign)` map __plugin/easy_align.vim__
1. `s:easy_align_op` __plugin/easy_align.vim__
1. `s:generic_easy_align_op` __plugin/easy_align.vim__
1. `easy_align#align`
1. `s:align`
1. `s:process`
1. `s:parse_nth`: Calculates the occurrence and if it alternates by using the passed string (e.g. `*`, `**`, `2`)

Case:

- Non-interactive
- Not live mode

## `s:highlighted_as`

1. Exposed `<Plug>(LiveEasyAlign)` map __plugin/easy_align.vim__
1. `s:live_easy_align_op` __plugin/easy_align.vim__
1. `s:generic_easy_align_op` __plugin/easy_align.vim__
1. `easy_align#align`
1. `s:align`
1. `s:interactive`
1. `s:process`
1. `s:do_align`
1. `s:split_line`: Uses the function in two places
1. `s:highlighted_as`: Retrieves information about the syntax

Case:

- Is live mode
