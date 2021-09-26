#!/usr/bin/env bash

printf "Press a key to display.\n\n"

run_with_option() {
  read -p "$1 " -n 1 -r
  # redirecting stderr also to display ffprobe info (with |&)
  ffprobe $2 |& less
}

run_with_option "Formats..." "-formats"

# These display the same as -formats
# run_with_option "Demuxers..." "-demuxers"
# run_with_option "Muxers..." "-muxers"

run_with_option "Devices..." "-devices"
run_with_option "Codecs..." "-codecs"
run_with_option "Decoders..." "-decoders"
run_with_option "Encoders..." "-encoders"
run_with_option "Bitstram filters..." "-bsfs"
run_with_option "Protocols..." "-protocols"
run_with_option "Filters..." "-filters"
run_with_option "Pixel formats..." "-pix_fmts"
run_with_option "Sample_fmts..." "-sample_fmts"
run_with_option "Channel names and layouts..." "-layouts"
run_with_option "Colors..." "-colors"
