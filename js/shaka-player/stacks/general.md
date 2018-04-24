# Shaka Player General Stacks

## shaka.media.Playhead.prototype.setStartTime

- shaka.cast.CastProxy.prototype.cast (/0)
- shaka.cast.CastSender.prototype.cast (/1)
- shaka.cast.CastSender.prototype.onSessionInitiated_ (/3)
- shaka.cast.CastSender.prototype.onSessionCreated_ (/1)
- shaka.cast.CastSender.prototype.onConnectionStatusChanged_ (/2+)
- shaka.cast.CastProxy.prototype.onResumeLocal_ (/1)
- shaka.Player.prototype.load (/3)
- **shaka.media.Playhead.prototype.setStartTime** (/1)

## shaka.net.Backoff.prototype.attempt

- shaka.Player
- shaka.Player.prototype.defaultConfig_ [bound] (/5)
- shaka.Player.prototype.defaultStreamingFailureCallback_ (/1)
- shaka.Player.prototype.retryStreaming (/1)
- shaka.media.StreamingEngine.prototype.retry (/1)
- shaka.media.StreamingEngine.prototype.scheduleUpdate_ (/many in this file)
- shaka.media.StreamingEngine.prototype.onUpdate_
- shaka.media.StreamingEngine.prototype.update_ (/1)
- shaka.media.StreamingEngine.prototype.fetchAndAppend_ (/2)
- shaka.media.StreamingEngine.prototype.handleStreamingError_ (/2)
- **shaka.net.Backoff.prototype.attempt** (/2)
- shaka.net.Backoff.fuzz_ (/1)

This was useful to understand the `Backoff` service, which allows handling errors with retries in a way that avoids cycles of rapid retries, which can sometimes be bad for server loads. It is interesting the implementation of the fuzz function.

It was surprising how many times the `scheduleUpdate_` is called within the streaming engine. Also interesting that it is possible to pass a streaming failure callback to the config. The backoff system is also used in the networking engine.
