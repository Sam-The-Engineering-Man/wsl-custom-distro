# Overview
Here are the instructions on how to follow along with my custom WSL build. Feel free to modify the code, fork, and learn from it!
If you have any questions leave a comment on the video or in my community posts section and I will happily answer them!

# Steps
Download buildroot (You can use a newever version of buildroot but I have not tested that):  
``` bash
wget https://buildroot.org/downloads/buildroot-2026.05.1.tar.gz  
tar -xf buildroot-2026.05.1.tar.gz
``` 
Download this repo:  
``` bash
git clone git@github.com:Sam-The-Engineering-Man/wsl-custom-distro.git
cd ~/wsl-custom-distro
```
Copy configs:
``` bash
BUILDROOT="$HOME/buildroot-2026.05.1"
cp -a board/samlinux "$BUILDROOT/board/"
cp configs/samlinux_defconfig "$BUILDROOT/configs/"
```
Build:
```bash
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
cd "$BUILDROOT"
make samlinux_defconfig
make
```
Copy Build:
```bash
mkdir -p /mnt/c/WSL
mkdir -p /mnt/c/WSL/SamLinux
cp output/images/rootfs.tar.gz /mnt/c/WSL/SamLinux.wsl
```

Import into WSL:
``` bash
wsl --install --from-file C:\WSL\SamLinux.wsl --name SamLinux
```

Run with:
``` bash
wsl -d SamLinux
```

# Troubleshooting
### Systemd user session fails to start

If you have multiple WSL distributions running and see:

    wsl: Failed to start the systemd user session

Try shutting down WSL completely and launching SamLinux again:

This is a known open bug with WSL: [WSL Issue #13848](https://github.com/Microsoft/WSL/issues/13848)

**Solution**

```bash
wsl --shutdown
wsl -d SamLinux
```