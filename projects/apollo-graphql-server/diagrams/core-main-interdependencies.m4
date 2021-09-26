define(FILE_COMMON_PROPS, `bgcolor="darkgoldenrod1:cornsilk"
graph[style=dotted]')
define(FILE_SECTION_PROPS, `bgcolor="lightcyan2:deepskyblue"
graph[style=rounded]')


digraph {
  rankdir=LR
  bgcolor="deepskyblue:lightblue"
  compound=true
  label=<<B>Core Main Interdependencies</B>>
  labelloc=t
  graph [autosize=false, size="11.8", ratio=1]

  node[color=purple, style=filled,fillcolor=none]
  graphql[fillcolor=black,fontcolor=white,color=black]

  subgraph cluster_runQuery {
    FILE_COMMON_PROPS
    label="runQuery.ts"

    runQuery,doRunQuery[shape=box];

    runQuery -> doRunQuery

    subgraph cluster_interfaces {
      FILE_SECTION_PROPS
      label=interfaces

      GqlResponse
      LogMessage[fillcolor="chartreuse3:aquamarine2"]
      LogFunction[fillcolor="chartreuse3:aquamarine2"]
      QueryOptions
    }

    subgraph cluster_enum {
      FILE_SECTION_PROPS
      label=enums

      LogStep[fillcolor="chartreuse3:aquamarine2"]
      LogAction[fillcolor="chartreuse3:aquamarine2"]
    }

    subgraph cluster_funcs {
      FILE_SECTION_PROPS
      label=functions

      runQuery[fillcolor="chartreuse3:aquamarine2"]
      doRunQuery[color=yellow]
    }

    doRunQuery -> LogAction
    doRunQuery -> LogStep
    LogMessage -> LogAction
    LogMessage -> LogStep
    LogFunction -> LogMessage
    QueryOptions -> LogFunction
  }

  subgraph cluster_graphqlOptions {
    label="graphqlOptions.ts"
    FILE_COMMON_PROPS

    subgraph cluster_interfaces2 {
      label=interfaces
      FILE_SECTION_PROPS

      GraphQLServerOptions[fillcolor="chartreuse3:aquamarine2"]
    }

    subgraph cluster_funcs2 {
      label=functions
      FILE_SECTION_PROPS

      resolveGraphqlOptions[fillcolor="chartreuse3:aquamarine2", shape=box]
      isOptionsFunction[shape=box]
    }
  }

  subgraph cluster_http {
    FILE_COMMON_PROPS
    label="runHTTPQuery.ts"

    subgraph cluster_interfaces3 {
      FILE_SECTION_PROPS
      label=interfaces

      HttpQueryRequest[fillcolor="chartreuse3:aquamarine2"]
    }

    subgraph cluster_classes {
      FILE_SECTION_PROPS
      label=classes

      HttpQueryError[fillcolor="chartreuse3:aquamarine2"]
    }

    subgraph cluster_funcs3 {
      FILE_SECTION_PROPS
      label=functions

      isQueryOperation[shape=box,color=yellow]
      runHTTPQuery[shape=box,fillcolor="chartreuse3:aquamarine2"]
    }

  }

  GraphQLServerOptions -> LogFunction
  GraphQLServerOptions -> graphql
  HttpQueryRequest -> GraphQLServerOptions
  doRunQuery -> "graphql"
  isQueryOperation -> graphql
  runHTTPQuery -> GraphQLServerOptions
  runHTTPQuery -> graphql
  runHTTPQuery -> isQueryOperation
  runHTTPQuery -> resolveGraphqlOptions[color=red]
  runHTTPQuery -> runQuery[color=yellow]
  resolveGraphqlOptions -> isOptionsFunction
}
