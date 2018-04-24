# Shaka Player Closed Issues PRs

Interesting merged PRs and closed issues

## Commit 7610fc11bd8867adb07640147ac740077dfe85da

- Closed: [683](https://github.com/google/shaka-player/issues/683)

This adds an option to the streaming configuration named `startAtSegmentBoundary` that when playing live streams, instead of starting at the calculated time in the loaded segment, it starts at the beginning of the loaded segments. This can cause an even bigger mismatch between the playhead and the real live edge.

## https://github.com/google/shaka-player/issues/602

This PR introduces the argument to differenciate the request type when overriding the http plugin. The enum was already created at that point. The commit involved passing the argument and creating a unit test.
