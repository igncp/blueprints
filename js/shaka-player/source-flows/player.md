# Player

## Player.prototype.load

### Basic Success Flow

- Validates that there is a video element
- Dispatches the `'loading'` event
- Unloads
- Cleans the stats
- Adds some event listeners to the video element
- Creates and configures the `abrManager` (Adaptative Bitrate)
- Creates and configures the `textDisplayer` (Text tracks - subtitles)
- Makes the request to load the manifest
- Filters the received variants so if there are Audio + Video variants, discard the rest
- Creates and configures the `drmEngine`
- Initializes the `drmEngine` (asynchronous)
- After the initialization of the DRM, filter the periods from the manifest
- Set the beginning and end of the playback in the stream (in case it is not live)
- Initializes the `abrManager`
- Creates the `mediaSourceEngine` only if not already created, and sets the text displayer
- Creates the `playhead` and `playheadObserver`
- Creates and configures the `streamingEngine`
- If the content is multi-codec, choose now the codec to play
- Dispatches the `'streaming'` event
- Initializes the `streamingEngine`
- Sets up the playhead start time
- Dispatches an event for tracks changed and another for adaptation
- Sets the variants in the `abrManager`
- Adds timeline regions to the playhead observer
- Adds an event listener (once) to `'loadeddata'` to save the latency in the stats
- Clears the `onCancelLoad_` callback

## Player.prototype.load

### Normal case (very few and similar branches)

- Inherits from `shaka.util.FakeEventTarget`
- Sets to `null` many members: engines, `playhead_`, etc. and also sets empty arrays
- Sets some members using values from `this.config_`
- Creates the `_eventManager`
- Creates the empty stats
- Calls the dependency injector (second argument, optional) passing the context
- Creates the `networkingEngine_`
- If the video element is passed, calls `this.attach`
  - Adds an event listener to `'error'` to the video element
  - Creates the `mediaSourceEngine_`
  - Opens the `mediaSourceEngine_`

## Player.prototype.trickPlay

- Passes the rate (number) to the playhead using `setPlaybackRate`. Rate === 1 would mean normal play
  - The playhead just passes the rate to the video wrapper created by the playhead
    - The video wrapper sets the `playbackRate` of the video element. Common browsers only support positive playbackRate
    - It also sets up a timer repeated every 0.25 s if the rate is negative (backwards) which is faked
- Passes to the `streamingEngine` a value of if there is trick play 
  - The `streamingEngine` will validate that there are video streams that support trick play (otherwise will not do anything)

## Player.prototype.onKeyStatus_

### Context

- Callers:
  - shaka.media.DrmEngine.prototype.processKeyStatusChanges_
    - shaka.media.DrmEngine constructor [via shaka.util.Timer]
- Callees:
  - this.streamingEngine_.getCurrentPeriod
  - this.streamingEngine_.getActiveAudio
  - this.streamingEngine_.getActiveVideo
  - shaka.util.StreamUtils.getVariantByStreams
  - this.chooseStreamsAndSwitch_
  - this.onTracksChanged_
  - shaka.util.StreamUtils.filterVariantsByLanguageAndRole
  - this.abrManager_.setVariants

### Flow

- Validates that the DRM engine has been configured
- Validates that it has been passed key statuses
- Validates that there is not only one synthetic key status
- Loops through the variants to:
  - Set the `allowedByKeySystem` property in each of the variants
  - Check if the tracks changed in any of the variants
- Gets the active variant
- Checks if the active variant is allowed by the key system
  - If not, switches streams
- If the tracks changed (which was checked in the loop):
  - Calls on track changed
  - Sets the variants in the `abrManager_`
