# inotify-cho

inotify-cho is a service that changes group ownership of a file or directory moved to a watched directory.

## Getting Started

### Prerequisites

* [inotify-tools](https://github.com/rvoicilas/inotify-tools/wiki)

### Install

```bash
sudo bash install.sh
```

```bash
Copying files..
Making directories..
Adding permissions..
Adding service..
Starting service..
inotify-cho.sh is running, pid=3667
```

### Uninstall

```bash
sudo bash uninstall.sh
```

```bash
Finishing service..
Deleting service..
Deleting files..
Deleting directories..
Done
```
## References

* [Blog - awk.space](https://awk.space/blog/inotifywait-batching/)
* [Colaboratorio](https://colaboratorio.net/davidochobits/sysadmin/2017/registro-cambios-sistema-ficheros-inotify/)
* [Stack Exchange](https://unix.stackexchange.com/questions/20357/how-can-i-make-a-script-in-etc-init-d-start-at-boot)
