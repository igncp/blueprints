# Media Source Engine

## MediaSourceEngine.prototype.init

- Waits till the `MediaSource` has been created, setup and attached to the video element
- Loops through all the streams in the `streamByType` map
  - First it validates that the stream is supported
  - When the stream is of type text, uses the `TextEngine` to handle the mime type
  - Otherwise, first it checks if it needs to use the transmuxer and if the transmuxer would support this stream
    - If that is the case, it initializes a new `Transmuxer` and generates a new mime type
  - Then it creates a `sourceBuffer` adding it to the MediaSource - Example about this: https://developer.mozilla.org/en-US/docs/Web/API/MediaSource/addSourceBuffer
  - It saves and adds event listeners to the source buffer
