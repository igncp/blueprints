# Transmuxer Flows

## shaka.media.Transmuxer.prototype.transmux

This requires the `mux.js` external library

- It validates that it is not already transmuxing
- It creates a new `Uint8Array` with the passed array buffer
- It pushes the created `Uint8Array` to the persisted muxer and flushes the muxer
- Returns a promise that will eventually resolve in the result `Uint8Array` with cues
  - The `PublicPromise` is called on the `done` event listener for the transmuxer
  - This transmuxer also listens to the `data` event to extract the cues and binary data
