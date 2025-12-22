> This page contains tips and tricks geared for users with moderate technical proficiency 🐧.

# GlobalConnect VPN for the Privacy-Minded

Are the privacy and security concerns of installing a system-wide VPN preventing you from SSHing or FTPing into a server?

Do you have the almost-primordial spine-tingling sense that Respondus is still looking through you through your webcam 2 years after you uninstalled it after graduating from high school?

<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/4zH9Zca1vRM?si=9KdfCt2iEOHJwN2P" title="YouTube video player" frameborder="0" allow="clipboard-write; encrypted-media; picture-in-picture; web-share" allowfullscreen></iframe>
</center>

Although you might not need to FTP or SSH into a server behind GlobalConnect VPN for this class, you *might* need to in the future. This is bad news if you're a little paranoid about student surveillance.[^fn1]

---

Thankfully, Palo Alto provides Windows, Mac, and Linux clients, so all you need to do is set up a small Linux virtual machine in `virt-manager` or something, and now you don't have to worry about surveillance when the virtual machine isn't running, and you don't need to route your entire system's traffic through a third party just to SSH or FTP into a server!

Unfortunately, you may discover than the Linux client is¸ academically speaking, garbage that doesn't work.

Thankfully, there is an open source and better GlobalConnect client for Linux that actually works: [https://github.com/yuezk/GlobalProtect-openconnect](https://github.com/yuezk/GlobalProtect-openconnect)

You can plug it into your VM's init system to start on boot, maybe even automate some of the login process, and that's that![^fn2]

[^fn1]: Also, you should be a [little](https://www.theguardian.com/technology/2023/oct/04/school-surveillance-tech-aclu-report) [more](https://www.eff.org/deeplinks/2020/12/student-privacy-and-fight-keep-spying-out-schools-year-review-2020) [paranoid](https://www.eff.org/files/2017/04/13/student-privacy-report.pdf). Student surveillance has gotten exponentially worse in the wake of the pandemic, and shows little sign of getting better.
[^fn2]: Alternatively, you could just install it into your main Linux environment with no virtualisation if that's already within your acceptable range of control / free-ness.

# Post-Processing Lecture for the Efficiency-Minded

Some people are very good lecturers, others... not so much. Regardless, there's not many people you can listen to above 1.5x speed without losing some understanding.

Your professors are human, and humans can leave pauses in their sentences, silently struggle to switch the Zoom screen share every time they share their screen, get way too close or way too far from the microphone, et cetera.

So while you can download videos and speed them up, it really doesn't solve some of the fundamental issues making lectures difficult-to-parse or way-too-long.

Here is an example/template of `ffmpeg` to apply moderate and slow speech normalization to a video clip:
```bash
ffmpeg -v quiet -i "$DOWNLOAD_FILE" -filter:a "speechnorm=e=6.25:r=0.00001:l=1" "$NORMALIZED_FILE"
```

Here is a tool to automatically trim silent portions of a video: [@WyattBlue/auto-editor](https://github.com/WyattBlue/auto-editor) (just install it into a Python virtual environment), and here is how to apply it:

```bash
${HOME}/Scripts/venv/bin/auto-editor "$NORMALIZED_FILE" --output "${NAME}.mp4" --no-open
```

If you need to download a Kaltura video[^fn3] to do all of this, you're going to want to use [yt-dlp](https://github.com/yt-dlp/yt-dlp), it should be on your package manager.

Here's how to download a Kaltura video:
```bash
yt-dlp "$URL" --output "$DOWNLOAD_FILE"
```

[^fn3]: Now, when Banksy says, "copyright sucks", he isn't telling you that you should start mass-producing crappy Banksy merchandise without his permission, and when he sues you he isn't being a hypocrite. Similarly, when I say that the fact that you already spent paid for tuition and are dedicating the best years of life to study means that you are entitled to watch the lectures you paid for in a way that's more convenient than through a crappy portal, I'm not telling you to reupload videos of people without their permission.

---

Alternatively, you could just chain all of these commands together into a small Bash script—
```bash
#!/usr/bin/env bash
cd "$(dirname "$0")" || exit
URL=$1
NAME=$2
DOWNLOAD_FILE="downloads/$NAME.mp4"
NORMALIZED_FILE="downloads/$NAME-norm.mp4"
# Download video
if [ ! -f "$DOWNLOAD_FILE" ]; then
    echo "Downloading ${NAME}..."
    mkdir -p "downloads"
    yt-dlp "$URL" --output "$DOWNLOAD_FILE"
fi
# Apply moderate and slow speech normalization (https://ffmpeg.org/ffmpeg-all.html#Examples-73)
if [ ! -f "$NORMALIZED_FILE" ]; then
    echo "Normalizing ${NAME}..."
    ffmpeg -v quiet -i "$DOWNLOAD_FILE" -filter:a "speechnorm=e=6.25:r=0.00001:l=1" "$NORMALIZED_FILE"
fi
# Apply auto-editor
if [ ! -f "${NAME}.mp4" ]; then
    echo "Applying auto-editor to ${NAME}..."
    auto-editor "$NORMALIZED_FILE" --output "${NAME}.mp4" --no-open --quiet
fi
```
—And then run it like so: `./download.sh "https://cdnapi.kaltura.com/p/BLAHBLAHBLAH" "Lecture 06"`{.bash}.

Or, you could do it in batch and with a wrapper for parallelization and niceness:

```bash
#!/usr/bin/env bash
cd "$(dirname "$0")" || exit
MAX_JOBS=8 
count=0
function dl {
    nice -n 19 ionice -c 3 ./download.sh "$1" "$2" &
    # Limit number of parallel processes
    ((count++))
    if (( count >= MAX_JOBS )); then
        wait -n
        ((count--))
    fi
}
dl "https://cdnapi.kaltura.com/p/e6dce" "Lecture 01 - Introduction" &
dl "https://cdnapi.kaltura.com/p/20ce3" "Lecture 02 - History" &
dl "https://cdnapi.kaltura.com/p/74e19" "Lecture 03 - Philosophy" &
dl "https://cdnapi.kaltura.com/p/3703e" "Lecture 04 - OS" &
dl "https://cdnapi.kaltura.com/p/43c24" "Lecture 05 - Commands" &
dl "https://cdnapi.kaltura.com/p/61edc" "Lecture 06 - Files" &
dl "https://cdnapi.kaltura.com/p/86742" "Lecture 06 - Vi and Emacs Editors I" &
dl "https://cdnapi.kaltura.com/p/d8445" "Lecture 07 - Vi and Emacs Editors II" &
dl "https://cdnapi.kaltura.com/p/e82ca" "Lecture 08 - Pipes and Filters" &
dl "https://cdnapi.kaltura.com/p/de9e4" "Lecture 09 - Regular Expressions" &
dl "https://cdnapi.kaltura.com/p/87898" "Lecture 10 - Grep" &
dl "https://cdnapi.kaltura.com/p/796d0" "Lecture 11 - Sed" &
dl "https://cdnapi.kaltura.com/p/d679e" "Lecture 12 - Awk" &
wait
```

## Bonus: How to Not Get Flash-Banged by Lecture

Bright-white lecture slides cutting a hole through your dark-theme desktop like the Sun being peeking behind the moon near the moment of totality to launch a sneaky assault your pupils?

Add this line to your MPV configuration (`~/.config/mpv/input.conf`):
```
I cycle-values vf "sub,lavfi=negate" ""
```

Now you can toggle a readable dark mode with `I` in MPV in any video!
