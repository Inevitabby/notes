# Two Primary Kernel Subsystems

1. **File System**: Deals with all input and output
	- Includes files and terminals
	- Integration of storage devices
2. **Process Management**: Deals with programs and program interaction
	- How processes share CPU, memory, and signals
	- Scheduling
	- IPC
	- Memory management

> **Note**: UNIX variants have slightly different implementations of various subsystems.

# Unix File Types

The UNIX filesystem contains several different types of files:
- **Ordinary Files**: Store your information.
	* E.g., documents, images, etc.
	* Always located under a directory file
	* Don't contain other files
- **Directories**: Organize groups of files
	* Branching points in the hierarchical tree
	* Can contain ordinary files, special files, and other directories.
	* Never contain "real" information, only organizes it.
	* All files are descendants of the root directory (`/`) located at the top of the tree.
- **Special Files**: Represent a real physical device.
	* E.g., printer, SSD, keyboard, etc.
	* UNIX considers any device attached to the system to be a file, including your terminal.
		+ By default, your terminal is the standard input file, standard output file, and standard error file!
	* **Two types of I/O** (usually found under `/dev`):
		1. **Character**
		2. **Block**

> **Three Default I/O Channels**:
> - **Standard Input (`stdin`)**: Where a program expects to find input
> - **Standard Output (`stdout`)**: Where a program writes its output
> - **Standard Error (`stderr`)**: Where a program writes error messages

> **Interprocess Communication**:
> - **Pipe**: One-way data channel that allows two processes to be linked.
> 	* Acts as a temporary file which exists to hold data from one command until it's read by another.
> - **Socket**: Two-way high-speed data channel that allows two processes on two machines to talk.

> **Remember**: File types aren't determined by extension on UNIX.
> - You can use the `file` command to find a file's type.

# UNIX File Names

**On File Names**:
- Most characters are permitted. Avoid **spaces**, **tabs**, and **metacharacters**.
- **Case sensitive**.
	* Which is why lowercase is recommended.
- Can be up to **256 characters long**.
- **Extensions** may be used to identify file types.
	* Even though UNIX doesn't need file extensions, some applications might.
- All files in same parent directory must have **unique** names
	* Files in separate directories can have identical names.

**Hidden Files**: Files that begin with a dot (`.`)
- E.g., `.zshrc`, `.mailrc`
- Most resource configuration files are hidden files. 

**Reserved Filenames**:
- Slash (`/`): **Root Directory**
- Dot (`.`): **Current directory**
- Double Dot (`..`): **Parent directory**
- Tilde (`~`): **Home directory**

# UNIX Pathnames

**Pathnames**: Specify where a file is located in the hierarchically organized file system.
- Each directory or filename is separated from the previous one by a `/`

**Two Kinds of Pathnames**:
- **Absolute Pathname**: Tells how to reach a file starting [from root]{.underline}.
	* Always starts with slash (`/`)
	* Examples: `/usr/bin/bash`, `/etc/portage/package.use/blender`
- **Relative Pathname**: Tells how to reach a directory [from your current working directory]{.underline}.
	* Examples: `../../daemon.sh`, `./markdown/06 - UNIX Files.md`

# Linux File System Hierarchy Standard (FHS)

> **Directory Tree**: All the files in the UNIX file system are organized into a multi-level hierarchy.
> - The UNIX file system can be envisioned as an inverted tree.
> - The very top of the file system is root (`/`), all other files are descendants of root.
> - The number of levels is largely arbitrary, but most systems have some organizational similarities.

**Linux File Hierarchy Structure (FHS)**: Defines the directory structure and contents in UNIX-like operating systems.
- Maintained by the Linux Foundation.
- All files and directories appear under root, even if they're on different physical or virtual devices.
- Some of these directories only exist on a particular system if certain subsystems are installed.
	* E.g., `/etc/X11` only exists if the X Window System is installed, etc.
- Most of these directories exist in all UNIX operating systems and are generally used in the same way.
	* Though, the FHS is not considered authoritative for platforms other than Linux.

## General FHS for Linux

- `/`: **Root**
	* Every single file and directory starts here.
	* Only root user has write privileges for this directory.
	* Note: `/root` is the root user's home directory, not root itself.
- `/bin`: **User binaries**
	* Contains essential low-level binary executables
	* Stores common commands and programs that are available to all users.
		+ e.g., `ps`, `ls`, `ping`, `grep`, `cp`
- `/sbin`: **System binaries**
	* Contains binary executables typically used by the system administrator.
		+ e.g., `iptables`, `reboot`, `fdisk`, `ifconfig`, `swapon`
- `/etc`: **Configuration files**
	* Contains configuration files requires by all programs.
		+ Also contains startup and shutdown shell scripts used to start and stop individual programs.
		+ e.g., `/etc/resolve.conf`, `/etc/hostname`
- `/dev`: **Device files**
	* Contains device files.
		+ Includes any device attached to the system (gamepads, terminal devices, USBs, etc.)
		+ e.g., `/dev/tty1`, `/dev/input/mouse0`, `/dev/nvme0`
- `/proc`: **Process information**
	* Contains information about running system processes.
		+ Is a pseudo/virtual filesystem.
		+ e.g., `/proc/{pid}` stores information about the process with that particular PID, `/proc/uptime` stores information about system uptime
- `/var`: **Variable files**
	* Contains files that are expected to grow/shrink (log files, database files, emails, etc.)
		+ e.g., `/var/log` `/var/lib`, `/var/mail`
- `/tmp`: **Temporary files**
	* Contains temporary files created by system and users.
	* Files in here are deleted when the system is rebooted.
- `/usr`: **User programs**
	* Contains binaries, libraries, documentation, and source-code for second-level programs.
	* `/usr/bin` stores binary files for higher-level user programs 
		+ e.g., `at`, `awk`, `cc`, `less`, `scp`
	* `/usr/sbin` stores binary files for system administrators
		+ e.g., `atd`, `cron`, `sshd`, `useradd`, `userdel`
	* `/usr/lib` stores libraries for `/usr/bin` and `/usr/sbin`
	* `/usr/local` stores user's programs installed from source
		+ e.g., `/usr/local/apache2`
- `/home`: **Home directories**
	* Contains user's personal files.
		+ e.g., `/home/inevitabby`, `/home/larry`, `/home/tkaczynski`
- `/boot`: **Boot loader files**
	* Contains boot loader-related files.
		+ Kernel initrd, vmlinux, and grub files are stored here.
		+ e.g., `initramfs-6.1.67-gentoo-dist.img`, `vmlinuz-6.1.67-gentoo-dist`
- `/lib`: **System libraries**
	* Contains library files for the binaries in `/bin` and `/sbin`
		+ Are either `ld*` or `lib*.so.*`
		+ e.g., `ld-2.11.1.so`, `libncurses.so.5.7`
- `/opt`: **Optional add-on apps**
	* Contains add-on applications from individual vendors.
- `/mnt`: **Mount directory**
	* Temporary mount directory where sysadmins can mount filesystems. 
- `/media`: **Removable devices**
	* Temporary mount directory for removable devices
		+ e.g., `/media/cdrom`, `media/floppy`. `media/cdrecorder`
- `/srv`: **Service data**
	* Contains server-specific services-related data
		+ e.g., `/src/cvs` contains CVS-related data.

> **Remember**: The `/usr` variants of folders that can be found under root contain higher-level versions of their counterparts!
> - For example, `/usr/bin` contains higher-level system utilities while `/bin` contains essential lower-level utilities.

# Fundamentals of Security (Groups)

UNIX is a multi-user system.
- A set of users can form a group, and
- A user can be a member of multiple groups.

UNIX systems have one or more users, identified by numeric **uid** and **username**.
* There is a special user with complete control (uid: 0, username: root)
* Every user has a username, numeric uid, and **default group** association.
	+ Associations with other groups are also possible.

> **Command**: `id` lets you view your uid, default groups, and which groups your belong to.

# Unix File/Directory Permissions

**Every file/directory has**:
1. A **single owner.**
2. An association with a **single group.**
3. A set of **access permissions** associated with it.
	- For a file, permissions control what can be done to its contents.
	- For a directory, permissions control whether files inside it can be listed, searched, renamed, or removed.

> Permissions lets us answer questions like:
> - Can this file be read or written?
> - Can this program be run?
> - Can this hardware be used?
> - Can this process be stopped?

## On Access Permissions

| Permission | For a File                         | For a Directory                                   |
|------------|------------------------------------|---------------------------------------------------|
| read       | Contents can be viewed             | Contents can be listed, but not searched          |
| write      | Contents can be changed or deleted | File entries can be added or removed              |
| execute    | File can be run as a program       | Directory can be searched, and you can `cd` to it |

Three **Types** of Permissions:
1. **Read** (`r`): Process may read contents of file, or list directory contents.
2. **Write** (`w`): Process may write contents of file, or add/remove directory contents.
3. **Execute** (`x`): Process may execute file, or open files in directory or subdirectories.

Three **Sets** of Permissions:
1. **User** (`u`): Permissions for **owner**
2. **Group** (`g`): Permissions for **group** (1 group per file)
3. **Other** (`o`): Permissions for everyone on the system.

> **Note**: Every user is responsible for controlling access to their files and directories.
> - Use this power with care!

## Viewing File Permissions

When using `ls -l` (long listing), file permissions are given in the following format—
- owner read (`r`)
- owner write (`w`)
- owner execute (`x`)
	* group read (`r`)
	* group write (`w`)
	* group execute (`x`)
		+ public read (`r`)
		+ public write (`w`)
		+ public execute (`x`)

—which are displayed as: `-rwxrwxrwx`
	- The **first character** shows file type:
		1. File: `-`
		2. Directory: `d`
		3. Link: `l`
	- If a `r`, `w`, or `x` is replaced by a `-`, that permission is denied for that respective set.
	- Starting after the file type character, the:
		* First `RWX` triplet are for the user owner,
		* Middle `RWX` triplet are for the group, and
		* Last `RWX` triplet are for others. 

> **Examples**: Reading `ls -a`
> 
> `-rwxr-xr-x 1 larry larry 15480 Dec 28 23:16 a.out`
> - A file that everyone has execute and read permissions for, but only the owner has write.
> 
> `drwxr-xr-x 1 larry larry     0 Dec 28 23:17 directory`
> - A folder that everyone has execute and read permissions for, but only the owner has write.
> 
> `-rw-r--r-- 1 larry larry    90 Dec 28 23:16 source.c`
> - A file that everyone has read permissions for, but only the owner has write.

# Utilities for Manipulation File Attributes

- `chmod`: Change file permissions
	* Format: `chmod [permission] [filename]`
- `chown`: Change file owner
	* Format: `chown [username] [filename]`
- `chgrp`: Change file group
	* Format: `chgrp [groupname] [filename]`
- `umask`: User file creation mode mask
	* Only the owner or superuser can change file attributes.
	* Upon creation, default permissions given to file modified by process **umask** value.

## Permission Settings for Octal Mode

Permission settings use octal numbers:

| Permission | Binary | Octal |
| ---        | ---    | ---   |
| `r`        | `100`  | $4$   |
| `w`        | `010`  | $2$   |
| `x`        | `001`  | $1$   |
| **None**   | `000`  | $0$   |

- Each `r`, `w`, and `x` is actually an on/off toggle, and the math is pretty simple.
	* For example, $\text{rx} = 4 + 1 = 5$, or $\text{rwx} = 4 + 2 + 1 = 7$

> **Example**: Converting permissions to octal equivalents
> 
> | Permission  | Binary      | Octal |
> | ---         | ---         | ---   |
> | `rwx rwx rwx` | `111 111 111` | `7 7 7` |
> | `rwx r-x r-x` | `111 101 101` | `7 5 5` |
> | `rw- r-- r--` | `110 100 100` | `6 4 4` |
> | `r-- --- ---` | `100 000 000` | `4 0 0` |
> - These codes (`777`, `755`, `644`, and `400`) are the most-common codes.

> **Example**: Using `chmod` with symbolic access mode (`{u,g,o}/{r,w,x}`) and octal access mode
> 
> > **Format**: `chmod [ugoa] [+-=] [rwx] [file/dir]`
> > - `[ugoa]`: User, group, other, and all, respectively. (Defaults to user)
> > - `[+-=]`: Add, remove, and set permissions, respectively.
> > - `[rwx]`: Permission code.
> > - `[file/dir]`: File or directory to apply it to.
> 
> ```bash
> $ chmod +x daemon.sh
> ```
> - Give execute permission to `daemon.sh` for current owner.
> 
> ```bash
> $ chmod o -r unreadable.txt
> ```
> - Remove read permission from `unreadable.txt`
> 
> ```bash
> $ chmod a=r-x file
> ```
> - Set permissions to `r-x` for `unreadable.txt` for all.
> 	* Notice how when using `=` we need to specify all three permission codes.
> 
> ```bash
> $ chmod go-w unwriteable.txt
> ```
> - Remove write permission from `unwriteable.txt` for group and other.
> 
> ```bash
> $ chmod g:cs2600-x unexecutable
> ```
> - Remove execute permissions from `unexecutable` from the cs2600 group.
> 	* Note: When a specific group isn't given, your default group is the one that's modified by chmod.
> 
> ```bash
> $ chmod 600 my_file
> ```
> - Set permissions for owner to be able to read and write, give no permissions to group and other.
> 
> ```bash
> $ chmod 755 our_file
> ```
> - Set permissions for owner to be able to read, write, and execute; give only read and write permissions to group and other.
