#!/bin/bash
/usr/bin/ffmpeg -reconnect 1 -reconnect_at_eof 1 -reconnect_streamed 1 -reconnect_delay_max 2 -y -nostdin \
-i http://192.168.1.8:9981/stream/channelnumber/101 \
-c copy -map 0:0 -map 0:1\
-fflags -user_agent HLS_delayer \
-f hls -hls_flags delete_segments \
-hls_time 5 \
-hls_list_size 6 \
-hls_wrap 7 \
-hls_segment_filename /home/hts/nas1/Timeshift/BBC1_%03d.ts /home/hts/nas1/Timeshift/BBC1.m3u8
