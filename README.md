# Capabilities Tracker

This adds the capable bcc tracer to podman using oci-hooks.

## Installation

1. Install the dependencies:
  * [bpftool](https://github.com/torvalds/linux/tree/master/tools/bpf/bpftool)
  * [bcc](https://github.com/iovisor/bcc)
  * gcc, glibc
  ```
  dnf install bpftool bcc gcc glibc-static
  ```
2. Run `make && sudo make install` in the project directory to install


## Usage

1. Run the `capabilities-tracker`
2. Start your container with `podman run --annotation io.containers.trace-capabilities=true ...`
3. Check out the stdout of the `capabilities-tracker` process

## Issues

If you get permission denied errors in /sys/fs/bpf with SELinux,
you can enable access with:

```
# ausearch -c 'bpftool' --raw | audit2allow -M my-bpftool
# semodule -X 300 -i my-bpftool.pp
```

## Uninstall

Uninstall with `make uninstall`
