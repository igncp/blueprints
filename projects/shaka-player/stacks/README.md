# Shaka Player Stacks

The stacks are just lists of possible nested caller -> callee. Most of the time, it is one of the multiple possibilities.

Adding in some of the stacks the number of occurrences. If a row has /X, for example:

- A
- B (/2)

This means that there are two places where B is called, including A. If there is a `+`, for example (/2+) it means that there are more than two but the locations are not clear.

Trying to make sure that a stack is possible: e.g. sometimes A -> B -> C -> D, if D could never be called if B is called, the stack would be impossible. The number of occurrences are not only for the possible stacks. 
