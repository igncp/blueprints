# Project Understanding

# Areas

- Levels
    - high: architecture, modules, flows
    - low: details, coding patterns, flows
    - periferial: build system, scripting, flows
    - external: dependencies
- Social
    - Contributors
    - Issues: check the "Good first issue", "Easy", etc.
    - Pull Requests
    - Stack Overflow, Slack, Mailing
    - Jira, issue trackers
- Documentation Sources
- Misc
    - Project length
    - Updates frequency
    - Languages, LoC, etc.
- Understanding
    - Reading without notes
    - Memorizing
    - Reading with notes
    - Processing notes
    - Making updates
    - Setting up infrastructure
- Performance / Motivation
    - Schedule
    - Use breaks and rest periods in advantage: revisit topics after a few days
    - Set goals
    - Set scope
    - Contribute
    - Alternate difficulty:
        - Difficult: answers, flows, fn definitions, summaries
        - Easy: doubts, reading, stats, setup
- Keep the TODO (remaining, in progress) up to date
    - Add reasoning if necessary

# Structure

Important sections (or files / directories):

- Glossary
- Flows
- Stacks: Easy to build but bring less value than flows
- Answers: Completed doubts from `Todo`
- Reviews of issues / prs
- Resources: links, documentation, etc. Include vendors docs.
- Infrastructure / Tooling
- Source: Includes list with explanation of functions, classes, arguments, etc.
- Tests: Can be new tests (verified), the structure, or comments about specific tests
- Unstructured: Some notes that may be moved or removed in the future
- Todo:
    - Include once-time-only and periodic tasks
    - Include goals
    - Include questions (empty list is a bad sign)
    - Import doubts from [the generic list](./doubts.md) if necessary
- Setup: scripts, Dockerfiles, etc.
    - Add a README.md if necessary
    - Add custom installers (manual and automatic) with instructions
    - If any file needs to be added manually, also add instructions and links
- Memorization: tests, questions
- Examples: Can be comments about existing examples or new examples (they need to be run and verified)
    - Use the Tests document when possible which are a better type of example
    (when tests passing) than documentation examples
- Essays:
    - Articles that summarize the understanding about one topic. Can be revisited / updated in future.
    - Ideally with creation date and edited date

Ideas

- Summaries: Strictly derived from notes
- Context: Reasoning for the project or the internal parts

Workflow

- Start in two files (todo.md and REAMDE.md), then split into multiple files / directories
- Never let the todo list / doubts list to grow too much or be empty
- Never let the Unstructured Content grow too much (can be empty)

# Periodic Tasks Examples

- Find resources
- Create flows examples
- Review and modify existing examples
- Note down API docs references in the examples
