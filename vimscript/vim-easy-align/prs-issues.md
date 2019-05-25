# PRs and Issues

## PR-125 Merged: Allow 'easy-align.txt' to be listed in the LOCAL ADDITIONS section of help.txt

The help file was edited to wrap the first field of the first line in
astherisks. This converts it into a TAG. The contributor pointed to `:h
help-writing` where it recommends this pattern.

## PR-99 Merged: add g:easy_align_nth to allow configuring default nth

The contributor introduces a new global variable: `g:easy_align_nth`. This is
used in the `s:process` function where it would pass it to `s:parse_nth` if it
exists. The change in the source was minimal but the maintainer asked to add tests.

Several tests were added to `interactive.vader`. It checks for wether
`g:easy_align_nth` has certain values or is `unset` and the effect in a
markdown table.

## PR-52 Merged: Fix repeat of visual LiveEasyAlign

Inside of `s:interactive`, when calling `s:echon` to save the
`g:easy_align_last_command`, the change adds two lines surrounding this line.
It would first set the `s:live` flag to `0` and the back again to `1`.

It fixes the ISSUE-51.
