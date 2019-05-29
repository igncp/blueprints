# Answers

## What is the `s:live` flag?

There is a "Live interactive mode" where one can preview the results of the
input: https://github.com/junegunn/vim-easy-align#live-interactive-mode . Can
run this `:LiveEasyAlign` command to use but there are other ways.

## What is `&cpo`

It is a flag native from Vim which means 'compatible options': `:help cpo`. It
is used in the library to reset the compatible options during execution till
all the script has been read. There is more explanation here:
https://vi.stackexchange.com/a/2117 .

It includes the case for `set cpo&vim` which is also happening.

## What is the `g:easy_align_last_command` variable used for

Whenever an alignment is done (live or not) the succession of operations are
saved in this variable. Then in the `plugin/easy_align.vim` file a `<Plug>` map
is exposed to repeat the last command, calling the function `s:repeat_visual`.

## In what format is the `g:easy_align_last_command` saved

It is a string containing the `join` result from `s:echo`. It is something like
`:EasyAlign 2\ `.

## How to align by one custom delimeter (e.g. `a`)

There may be more ways (e.g. Live mode), but I've found that it is possible to
achieve this by defining a custom delimeter key: `g:easy_align_delimiters = {
'I': { 'pattern': 'I' } }`. Then, it is just required to select the lines and
call: `:EasyAlign I`.

## What is `ignore_groups` refering to in the source

Ignore groups is a configuration option that is a list containing `'Comment'`,
`'String'`, or both. It would not align comments (or viceversa) if set.
