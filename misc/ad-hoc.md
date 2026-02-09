---
title: "Ad Hoc Bash One-Liners"
---

These should be sorted into actual categories whenever I make them them, but until then, I'm just throwing them here.

# Slightly Hotter Flutter Hot Reload

Flutter's hot reload is good, but it doesn't trigger on file-edits. *(For that, they rely on IDEs to provide their own signals whenever the user saves.)*

This one-liner starts `flutter run` and triggers a hot reload whenever `entr` detects an update in `lib/*.dart` (so make sure you're running it in your git root)

```bash
(trap 'kill 0' SIGINT; flutter run & PID=$!; \
	find lib/ -name "*.dart" | \
	entr -p kill -USR1 $PID)
```

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

Moved to two monolithic scripts:
- [https://github.com/Inevitabby/DS-OTA-Backup](https://github.com/Inevitabby/DS-OTA-Backup)
- [https://github.com/Inevitabby/DS-Lite-Private-AP](https://github.com/Inevitabby/DS-Lite-Private-AP)

I don't even keep the repos on my PC because these scripts are complete—

```bash
$ ls
backups  DS_AP  lnxrouter  NDS_BACKUP
```

—I just have the scripts in a single folder for easy administration now.
