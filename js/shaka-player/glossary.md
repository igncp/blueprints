# Shaka Player Glossary

## Specific to the project

- **Fake Events**: JavaScript objects that have some properties similar to native browser events, like for example `bubbles`, `cancelable`, etc.

## Domain

- **Initialization Segment**: "The initialization segment contains information required to initialize the video decoder. The initialization segment is optional (refer to ISO/IEC 23009-1).". "Segment containing metadata that is necessary to present the media streams encapsulated in Media Segments". https://www.w3.org/TR/media-source/#init-segment
- **Media Segment**: "A sequence of bytes that contain packetized & timestamped media data for a portion of the media timeline. Media segments are always associated with the most recently appended initialization segment."
- **Period**: Top level elements in the MPD. https://www.brendanlong.com/the-structure-of-an-mpeg-dash-mpd.html
- **Variant**: When the packager creates the periods, it creates several versions of the same period at different bitrates / resolutions. These are the variants (audio / video pairs). Then each variant streams are divided into segments. https://www.brendanlong.com/the-structure-of-an-mpeg-dash-mpd.html
- **box**: "object‐oriented building block defined by a unique type identifier and length.”
- **mvhd box**: Movie Header Box (more info in CFF document)
- **tfdt box**: Track Fragment Decode Time Box (more info in CFF document)
- **Clear Key Encryption**: Supported by the EME (Encrypted Media Extension) it is a simpler way to encrypt content than a DRM solution, usually not used comercially. It has multiple levels of security: for example, single non-rotating key (not very secure), short duration key rotation (more secure). The spec currently mandates that all browsers supporting EME must implement Clear Key
- **Common Encryption**: (CENC) "Allow content providers to encrypt and package their content once per container/codec and use it with a variety of Key Systems, CDMs and clients"
- **CDM**: Content Decryption Module - related to EME
- **WebM**: "Open, royalty-free, media file format designed for the web. WebM defines the file container structure, video and audio formats. WebM files consist of video streams compressed with the VP8 or VP9 video codecs and audio streams compressed with the Vorbis or Opus audio codecs. The WebM file structure is based on the Matroska container."

## Misc

- **Sintel**: Name of a popular movie from the Blender foundation that is typically used for streaming apps as it has free rights

## Missing

- **Presentation time offset** (test/test/util/stream_generator.js)
- **minBufferTime** (https://github.com/google/shaka-player/issues/683)
