# Shaka Player Source

- The code is already using `async/await`
- Most of the playback logic is defined under `shaka.media.*`
- One common pattern is the wrapping existing HTML5 APIs and operations in Promises

## lib/player.js

- The `Player` class `inherits` from `shaka.util.FakeEventTarget`.

## Engines

- media/drm_engine.js: Handles DRM like Widevine or PlayReady
- media/media_source_engine.js: Wraps all operations on `MediaSource` and `SourceBuffers`
- media/streaming_engine.js: This is a big and important entity. All related with manifest, video and audio streams, points, ...
- net/networking_engine.js
- offline/db_engine.js: This manages all operations on an IndexedDB (using promises). Implements IStorageEngine
- offline/i_storage_engine.js: Interface
- offline/storage_engine_factory.js
- text/text_engine.js: Manages text parsers and cues.
