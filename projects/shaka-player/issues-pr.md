# Shaka Player Issues and PRs

## Marked as 'easy?'

Interesting merged PRs and closed issues

### CLOSED: Commit 7610fc11bd8867adb07640147ac740077dfe85da

- Closed: [683](https://github.com/google/shaka-player/issues/683)

This adds an option to the streaming configuration named `startAtSegmentBoundary` that when playing live streams, instead of starting at the calculated time in the loaded segment, it starts at the beginning of the loaded segments. This can cause an even bigger mismatch between the playhead and the real live edge.

### CLOSED: https://github.com/google/shaka-player/issues/602

This PR introduces the argument to differentiate the request type when overriding the http plugin. The enum was already created at that point. The commit involved passing the argument and creating a unit test.

### CLOSED: https://github.com/google/shaka-player/issues/645

This handles the special 202 HTTP status code, which means that the requester should try again as the request can be processed but not completed (for example, a stream is in progress of being encoded). The actual implementation is just one condition extra to consider a response valid and add a unit test to cover this.

### CLOSED: https://github.com/google/shaka-player/issues/135

This supports customizing the license request URL. The commit also fixed another issue.

## Marked as 'help wanted'

-

## Marked as 'hard?'

### CLOSED: https://github.com/google/shaka-player/issues/68

This adds support for multiple base URLs. The extra URLs are used to try to recover on error status by requesting these different sources. It does not support failover in subtitles.

The fix was done in a big PR which included unit and integration tests. It added a new class to handle the manifest URI, that before was a single string but now it is an array. In many cases, it involved updating just the type from `goog.Uri` to `!Array.<!goog.Uri>`. Also wrapped the main `Uri` by a new class `shaka.util.FailoverUri`. 

This issue was created internally to follow the DASH specification.
