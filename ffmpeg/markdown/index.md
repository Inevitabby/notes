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

### Audio Bitrate (`-b:a`)

e.g.,
```bash
-b:a 32K
```

### Stereo and Mono Audio Rates (`-ar`)

> **Source**: [*Opus Recommended Settings*, xiph.org](https://wiki.xiph.org/Opus_Recommended_Settings)

> **Note**: Stereo unless specified otherwise

| Use Case                | Bitrate (Kb/s)         | Notes                                            |
|-------------------------|------------------------|--------------------------------------------------|
| VOIP                    | 10—24                  |                                                  |
| Audiobooks              | 24 (Mono), 32 (Stereo) | Past 24 delivers fullband                        |
| Music Streaming / Radio | 64—96                  | Superior quality to MP3, AAC, and Vorbis here    |
| Music Storage           | 96—128                 | 128 is virtually indistinguishable from lossless |

> **Audio Bands in Telephony:**
> 
> | Name          | Range (Hz) |
> |---------------|------------|
> | Narrowband    | 300—3,400  |
> | Wideband      | 50—7,000   |
> | Superwideband | 50—14,000  |
> | Fullband      | 20—20,000  |
> 
> > **Source**: [*Wideband audio*, Wikipedia](https://en.wikipedia.org/wiki/Wideband_audio)
