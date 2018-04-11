# Player

## Player.prototype.load

### Basic Success Flow

- Validate that there is a video element
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
- Sets some mebers using values from `this.config_`
- Creates the `_eventManager`
- Creates the empty stats
- Calls the dependency injector (second argument, optional) passing the context
- Creates the `networkingEngine_`
- If the video element is passed, calls `this.attach`
  - Adds an event listener to `'error'` to the video element
  - Creates the `mediaSourceEngine_`
  - Opens the `mediaSourceEngine_`
