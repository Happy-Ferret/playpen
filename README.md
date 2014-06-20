Playpen is a secure application sandbox built with modern Linux sandboxing features.

# Features

* The sandboxed application is spawned inside a systemd scope unit, providing
  integration with systemd tools like `systemd-cgtop` and robust control group
  management.
* The application is contained inside a read-only root directory with `chroot`.
* A mount namespace is leveraged to provide writable /tmp, /dev/tmp and home
  directories as in-memory (tmpfs) filesystems. Since these mounts are private,
  any number of Playpen instances can share the same root.
* The memory of all contained processes is limited via the scope unit's memory
  control group. The memory control group will include usage of the private
  tmpfs mounts towards the total.
* System call whitelisting forbids all but the `execve` call by default.
* Device whitelisting prevents reading, writing or creating any devices by default.
* The initial process and any forked children can be reliably killed.
* An optional timeout can take care of automatically killing the contained processes.
* A process namespace hides all external processes from the sandbox.
* A network namespace provides a private loopback and no external interfaces.
* The system's hostname and IPC resources are hidden from the sandbox via
  namespaces.

# Dependencies

* Linux 3.8 or later
* [libseccomp](http://sourceforge.net/projects/libseccomp/) 2.1.1 or later
* systemd
