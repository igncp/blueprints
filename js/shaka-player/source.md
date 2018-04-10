# Shaka Player Source

- The code is already using `async/await`
- Most of the playback logic is defined under `shaka.media.*`
- One common pattern is wrapping existing HTML5 APIs and operations in Promises

## lib/player.js

- The `Player` class `inherits` from `shaka.util.FakeEventTarget`.

## Engines

- **media/drm_engine.js**: Handles DRM like Widevine or PlayReady
- **media/media_source_engine.js**: Wraps all operations on `MediaSource` and `SourceBuffers`
- **media/streaming_engine.js**: This is a big and important entity. All related with manifest, video and audio streams, points, ...
- **net/networking_engine.js**
- **offline/db_engine.js**: This manages all operations on an IndexedDB (using promises). Implements IStorageEngine
- **offline/i_storage_engine.js**: Interface
- **offline/storage_engine_factory.js**
- **text/text_engine.js**: Manages text parsers and cues.

## Polyfills

Polyfills functions are self-registered into an array, which is iterated when calling `installAll`.

- **fullscreen.js**: Unifies the fullscreen API accross browsers
- **indexed_db.js**: It removes `IndexedDB` if using the player in Chromecast.
- **input_event.js**: Fixes the `input` event in IE11
- **mathround.js**: Fixes `Math.round` for big numbers in IE
- **mediasource.js**: Patches for `MediaSource` for different browsers
- **patchedmediakeys_ms.js**: Implements EME for MS
- **patchedmediakeys_nop.js**: Stubs EME but all methods will fail
- **patchedmediakeys_webkit.js**: Implements EME for Webkit
- **videoplaybackquality.js**: "A polyfill to provide MSE VideoPlaybackQuality metrics. Many browsers do not yet provide this API, and Chrome currently provides similar data through individual prefixed attributes on HTMLVideoElement."
- **video_play_promise.js**: Avoids a message to the console when the play promise fails
- **vttcue.js**: Provides `window.VTTCue` (only when `TextTrackCue` already exists)

There is an additionally `all.js` file that provides the `installAll` function.

## Utils Files

After the `lib/media` directory, `lib/util` is the biggest dir for the source

- **abortable_operation.js**: "A utility to wrap abortable operations.  Note that these are not cancelable. Cancelation implies undoing what has been done so far, whereas aborting only means that futher work is stopped."
- **array_utils.js**: Array utility functions.
- **config_utils.js**: Helper functions to deal with config objects
- **data_view_reader.js**: 'Abstracts a DataView object'
- **ebml_parser.js**: 'Creates an Extensible Binary Markup Language (EBML) parser.', EBML was created for the Matroska format.
- **error.js**: Shaka error, which includes additional properties like severity, category, etc.
- **event_manager.js**: "Creates a new EventManager. An EventManager maintains a collection of "event bindings" between event targets and event listeners."
- **fake_event.js**: "Create an Event work-alike object based on the provided dictionary. The event should contain all of the same properties from the dict."
- **fake_event_target.js**
- **functional.js**: Functional utility functions
- **i_destroyable.js**: Provides the IDestroyable interface, that requires methods like `destroy`
- **language_utils.js**: Language utility functions and variables, for example the iso map from the letters langs to two letters langs
- **manifest_parser_utils.js**: A few utilities for manifests
- **map_utils.js**: "A set of map/object utility functions."
- **mime_utils.js**: For dealing with MIME types
- **mp4_parser.js**: Defines the `Mp4Parser`. ~330 LOC
- **multi_map.js**: Defines the `MultiMap`: Maps one key to an array of values
- **operation_manager.js**: A utility for cleaning up `AbortableOperations`, to help simplify common patterns and reduce code duplication.
- **pssh.js**: 'Parse a PSSH box and extract the system IDs.' Related with the "cenc" Initialization Data format for EME. Stands for 'Protection System Specific Header'.
- **public_promise.js**: Promises with public resolve and reject methods
- **stream_utils.js**: For dealing with streams and manifests. ~1000 LOC
- **string_utils.js**: ~200 LOC
- **text_parser.js**: Defines the `TextParser` which reads elements from strings
- **timer.js**: A simple cancelable timer
- **uint8array_utils.js**: ~140 LOC
- **xml_utils.js**: ~260 LOC
