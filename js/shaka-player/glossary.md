# Shaka Player Glossary

- **Fake Events**: JavaScript objects that have some properties similar to native browser events, like for example `bubbles`, `cancelable`, etc.
- **Initialization Segment**: "The initialization segment contains information required to initialize the video decoder. The initialization segment is optional (refer to ISO/IEC 23009-1).". "Segment containing metadata that is necessary to present the media streams encapsulated in Media Segments". https://www.w3.org/TR/media-source/#init-segment
- **Media Segment**: "A sequence of bytes that contain packetized & timestamped media data for a portion of the media timeline. Media segments are always associated with the most recently appended initialization segment."
- **Period **: Top level elements in the MPD. https://www.brendanlong.com/the-structure-of-an-mpeg-dash-mpd.html
- **Sintel**: Name of a popular movie that from the Blender foundation that is typically used for streaming apps as it has free rights
- **Variant**: https://www.brendanlong.com/the-structure-of-an-mpeg-dash-mpd.html
- **box**: "object‐oriented building block defined by a unique type identifier and length.”
- **mvhd box**: Movie Header Box (more info in CFF document)
- **tfdt box**: Track Fragment Decode Time Box (more info in CFF document)


## Missing

- **Presentation time offset** (test/test/util/stream_generator.js)
