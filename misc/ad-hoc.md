---
title: "Ad Hoc Bash One-Liners"
---

These should be sorted into appropriate actual note whenever I make them them, but until then, I'm just throwing them here.

# Flutter Hot Reload/Restart

Flutter run with hot reload on-edit from a separate terminal.

**1. App State-Preserving**

Hot reload with:

```bash
(trap 'kill 0' SIGINT; flutter run & PID=$!; \
	find lib/ -name "*.dart" | \
	entr -p kill -USR1 $PID)
```

**2. Full Hot Restart**

Hot restart with:

```bash
(trap 'kill 0' SIGINT; mkfifo /tmp/flutter_cmd 2>/dev/null || true; \
    cat /tmp/flutter_cmd | flutter run & PID=$!; \
    find lib/ -name "*.dart" | \
    entr -p sh -c "echo r > /tmp/flutter_cmd")
```

# Android Emulator

Launch emulator headlessly, wait for boot sequence, and connect with scrcpy.

```bash
(trap 'kill -9 0' SIGINT EXIT; \
	"${ANDROID_SDK}/emulator/emulator" -avd Pixel_9 -no-window & \
	adb wait-for-device; \
	adb shell 'while [[ -z $(getprop sys.boot_completed) ]]; do sleep 1; done'; \
	scrcpy -m 1024 --max-fps 30)
```

> **Aside**: You'll lose a lot of features (e.g., toolbar, hotkeys, decent performance), but the window won't fight your WM anymore.

# LISP

```bash
ls script.lsp | entr -c sbcl --script /_
```

> **Aside**: Failing Faster
> 
> If you do an infinite loop it can take a while to exhaust the heap. If you want to fail faster, use --dynamic-space-size, e.g.,
> 
> ```bash
> ls script.lsp | entr -c sbcl --dynamic-space-size 16 --script /_
> ```

# DS Lite AP & Backup

Moved to monolithic scripts:
- [https://github.com/Inevitabby/DS-OTA-Backup](https://github.com/Inevitabby/DS-OTA-Backup)
- [https://github.com/Inevitabby/DS-Lite-Private-AP](https://github.com/Inevitabby/DS-Lite-Private-AP)
