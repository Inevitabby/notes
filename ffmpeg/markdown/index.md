# FFmpeg Cookbook

> *I always end up searching online on how to do the same things over-and-over, decided to just jot them down here so I don't have to do that anymore.*

## libvpx-vp9

### Two-Pass Video Encoding

1. First pass (generates log file for the second pass)
```bash
ffmpeg -i input.mp4 -c:v libvpx-vp9 -b:v 2M -pass 1 -an -f null /dev/null
```
	- `-an` is to disable audio
	- `-b:v 2M` sets average bit-rate
		- Can use a constant bit-rate by doing `-b:v 0 -crf 30` *(but why do that?)*
2. Second pass
```bash
ffmpeg -i input.mp4 -c:v libvpx-vp9 -b:v 2M -pass 2 -c:a libopus -row-mt 1 output.webm
```

### Deadline

`-deadline` flag can be set to `realtime`, `good`, or `best` (default is `good`)

### Row-Based Multi-Threading

`-row-mt 1` flag activates multithreading, which is off by default.
- *(Has a bigger performance boost on higher-resolution videos.)*

## Universal Audio and Video

### Some Video Filter (`-vf`) Options

**Examples**:
```bash
# Resize to 480 width, -1 means FFmpeg will set height automatically.
scale=480:-1
# Change FPS to 20
fps=20
```

### Mono Audio

```bash
-ac 1
```
