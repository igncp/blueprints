# Flows

## Source

### High Level `./autload/vim-easy-align.vim@s:align`

1. Setup some flags depending on visual mode
1. Initialize variables
1. Define the delimiters (extending the defaults if necessary)
1. Parse the expression extracting more variables
1. Override some variables if in interactive mode
1. Process the variables generating an output
1. Update the lines using the output
1. Save the last command in a variable

### High Level `./autload/vim-easy-align.vim@s:update_lines`

Relatively small function

1. Loop through the arguments and set the line by trimming-right the content
