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
