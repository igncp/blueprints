# HLS Parser

Remember that this parser implements the ManifestParser

## shaka.hls.HlsParser.prototype.start

- Validates that the parser has been configured
- Saves the URI and the player interface internally
- Requests the manifest
  - Creates the request with the networking engine passing the retry parameters
  - Generates the `operation` from the request and returns it
- Parses the manifest
  - Extracts the playlist using `shaka.hls.ManifestTextParser`
  - Validates that it is the expected playlist type `shaka.hls.PlaylistType.MASTER`
  - Uses the playlist to internally create a single period (this concept is not from HLS)
  - Filters the period using the player interface
  - Calculates the timestamps
  - Verifies that the presentation timeline was not created and creates it (`shaka.media.PresentationTimeline`)
  - It branches into two possibilities, Live or VOD streams
    - In both cases it updates the streams in `this.uriToStreamInfosMap_` (which was populated when creating the period)
  - Defines the manifest in `this.manifest_`
- Sets up the timer to update
  - Validates the time and that there is an update period
  - Validates that there is no timer already created
  - Creates the timeout using `onUpdate_`
    - Updates the stream (if not live) by calling and parsing the manifest again
    - Once the manifest is parsed, it creates the segments
    - Sets up the timer again
- Returns the manifest
