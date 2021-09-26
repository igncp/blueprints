# Streaming Engine Tests - Shaka Player

- In both the unit and the integration there is a lot of previous setup before running the tests, although in unit a bit (~500LOC vs ~300LOC) more

## Unit

- It uses `runTest` to user `Util.fakeEventLoop` and simulate the time passing, also increasing the playhead time.

### Setup

- It creates two ranges maps (for initialization segments and for media segments)
- Defines `runTest` that will fake the even loop moving forward using `fakeEventLoop`
- Initializes Jasmine's fake timers and `PromiseMock`
- Defines `setupVod` where it will create a manifest with a fixed structure
  - It sets up a fake playhead, networking engine, fake presentation timeline and generates the manifest, all with fixed data
- Defines `setupLive` very similar to `setupVod`, by providing fixed values to the commented variables
  - When creating the fake presentation timeline it indicates that the stream is live
- Defines `setupNetworkingEngine` where it calls one of the test utils.
  - It needs two functions, one for generating the initialization segments and another for the media segments
- Defines `setupManifest`
  - It uses a test helper to generate the actual manifest
  - After creating the manifest, it updates the values with new `shaka.media.InitSegmentReference`
  - Creates a dummy video stream, adds it to a variant object, and adds the variant object to the manifest
- Defines `createStreamingEngine` to generate the tested instances
  - It creates a config object (using an optional config in the function), creates a player interface full or spies, and creates the instance
  - It also calls `.configure` in the instance which is synchronous
- Defines the `afterEach` where it destroys the instance and flushes the `PromiseMock`
- Defines the `afterAll` where it removes the configuration in the `PromiseMock` and Jasmine's fake timers
- Starts tests

## Integration

### Setup

The setup for the integration tests is similar to the unit tests with these important points:

- [Different] It creates a real video element with test metadata for 'Sintel'
- [Different] It creates a real `EventManager`, a real playhead and a real `MediaSourceEngine` (to which it passes the `video` elemet).
- [Different] Uses some generators from the tests utils to generate real mp4 streams, both live and VOD
- [Same] Still uses a fake networking engine
