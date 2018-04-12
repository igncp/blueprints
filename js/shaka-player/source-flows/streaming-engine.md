# Streaming Engine Flows

## StreamingEngine.prototype.init

- Validates that it was configured
- Gets the period index by using the player's playhead
- It gets the streams of the period and passes them to `onChooseStreams` from the player
- Validates that `onChooseStreams` returned valid streams
- Initializes the returned streams
  - It gets the period index again
  - It organizes the audio / video streams from the variant and the text
  - Builds a `streamsByType` map
  - Passes the `streamsByType` to the `mediaSourceEngine.init`
  - Once the async init is finished, it sets up the streams
  - After setting them up, it saves the media state from each stream and schedules their update
- After initialized, it calls `onInitialStreamsSetup` from the player
