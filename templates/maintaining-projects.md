# Maintaining Projects

## Periodic Tasks

These actions need to be made proactively:

- Talk with other maintainers to discuss:
    - Most tech debt
    - Most urgent issues
    - Easy issues to delegate
- Understand the system:
    - Take notes of the system to get new perspectives
    - Consider different levels (top, bottom) and perspectives
    - Review previous notes
    - Use other templates for this (like './project-understanding.md')
- Write tests to check important behaviours of a system:
    - Refactor to make sections easier to test
- Add linter rules to make source code more consistent
- Dependencies:
    - Can create POCs inside the repo (smallest and simplest the better)
    - For popular dependencies, review "Awesome" (and similar) lists
        - Start reviewing the topics titles
    - Upgrade dependencies: `npm outdated`
    - Study new useful dependencies and technologies
        - Additionally to POCs, try template applications
    - Study alternatives for current dependencies and technologies
    - Study extensions (plugins) for current dependencies and technologies
    - Improve your understanding of current dependencies and technologies
- Write about the project
- Discuss about weak points about the project
- Look for most impact with least effort, or more enabling effort
- Improve docs of existing API:
    - Try to stick with the main entry points (e.g. repo's README.md)
    - Add basic info even if supposed to known to lower barrier
    - Add easy-to-see lists of steps when practical (not changing often) for common flows
    - Add cheatsheets, editors plugins, tutorials references, etc.
