# TO-DO

## Unit

- Investigate the two failing tests in the setup
- Flows of the main / complex source functions [requires understanding arguments]:
    - `s:interactive`
    - `s:parse_args`
    - `s:do_align`
- List of all the functions in autoload with explanations
- List of the important variables in autoload with explanations
- Create fixtures in the setup to learn the different alignment options:
  https://github.com/junegunn/vim-easy-align#list-of-options
- Retrieve the meaning of some of the arguments (in source.md)

## Periodic

- Revisit docs: Main README.md, EXAMPLES.md, easy_align.txt
- Use fixtures to test as many features
    - Add `echo` commands through the code to debug
- Flows and Stacks
- Revisit notes: Refactor, fix, study
- Write summaries
- Import doubts or create custom ones

## Doubts

- What are bang interactive modes used for
- What do the different types of indentation (`'d'`, `'s'`, `'n'`, `'k'`) mean
- What does the system need to change to remove the live mode
- How does it detect what is a string (e.g. when `ig["String"]`). Does it
  consider backtick? Is it the same for every language?
- What areas would change to remove the right-align option in the modes

## Goals

- Get a thourough understanding of the library
