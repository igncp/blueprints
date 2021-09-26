# Apollo GraphQL Server

- Repository: https://github.com/apollographql/graphql-server
- Commit: b8bd73f854e5d8fad4e6043cca9645f4cd90f495
- Site: http://dev.apollodata.com/tools/graphql-server/index.html
- GraphQL types: http://graphql.org/graphql-js/type/

## Diagrams

### Core structure

#### [Core package structure](./diagrams/core-structure.svg)

__legend__: The black nodes are NPM dependencies and the white nodes / clusters are files.

#### [Core main interdependencies](./diagrams/core-main-interdependencies.svg)

__legend__:
  - Yellow border means private and purple border means public
  - Green fill means it is exported by `index.ts`. Black one means it is an external dependency.
  - Squares are functions
  - Coloured edges don't mean anything (just to facilitate differenciation)
