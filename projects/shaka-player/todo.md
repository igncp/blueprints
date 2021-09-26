# Shaka Player TODO

- Flows
  - [x] Player Constructor 
  - [x] Player Load
  - [x] Dash Parser Start: `lib/dash/dash_parser.js#start`
  - [x] Networking Engine Request: `lib/net/networking_engine.js#request`
  - [x] Networking Engine Register Schme: `lib/net/networking_engine.js#registerScheme`
  - [x] Streaming Engine Init: `lib/media/streaming_engine.js#init`
  - [x] Media Source Engine Init: `lib/media/media_source_engine.js#init`
  - [x] Player Trick Play: `lib/player.js#trickPlay`
  - [x] HLS Parser Start: `lib/hls/hls_parser.js#start`
  - [x] Media Source Engine Flush: `lib/media/media_source_engine.js#flush`
  - [x] shaka.media.Transmuxer.prototype.transmux

  - [ ] HLS Parser Update Stream: `lib/hls/hls_parser.js#updateStream_`
  - [ ] Streaming Engine Handle Period Transition: `lib/media/streaming_engine.js#handlePeriodTransition_`
  - [ ] Streaming Engine Switch Internal: `lib/media/streaming_engine.js#switchInternal_`
  - [ ] shaka.media.DrmEngine.prototype.init
  - [ ] shaka.media.SegmentIndex.prototype.fit
  - [ ] shaka.media.StreamingEngine.prototype.fetchAndAppend_
  - [ ] shaka.log.v1

- Stacks
  - [x] shaka.media.Playhead.prototype.setStartTime
  - [x] shaka.net.Backoff.prototype.attempt
  - [x] shaka.media.Transmuxer.prototype.transmux

  - [ ] shaka.media.DrmEngine.prototype.init

- Other
  - [ ] Read about 5 closed issues / prs with the label `easy?` or `help wanted` (2/5)
  - [ ] Read about 2 closed issues / prs with the label `hard?` (1/2)
