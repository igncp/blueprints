# Flows

## Source

### High Level `./autload/easy_align.vim@s:align`

1. Setup some flags depending on visual mode
1. Initialize variables
1. Define the delimiters (extending the defaults if necessary)
1. Parse the expression extracting more variables
1. Override some variables if in interactive mode
1. Process the variables generating an output
1. Update the lines using the output
1. Save the last command in a variable

### High Level `./autload/easy_align.vim@s:update_lines`

Relatively small function

1. Loop through the arguments and set the line by trimming-right the content

### High Level `./autoload/easy_align.vim@s:split_line`

1. Initiliazes variables, using `a:fc` (First Column) and `a:lc` (Last Column).
1. Initializes the tokens and delimiters to empty lists
1. Loops through the characters of the string that match the pattern
    1. With several conditions, it adds to the tokens and delimiters list
1. Handles the case where the last token is a delimiter
1. Handles the indentation case
1. Handles the line is a comment case
