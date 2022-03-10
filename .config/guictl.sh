#!/bin/sh

startgui() {
    for f in "/data/data/com.termux/files/home/.vnc/localhost.$f.pid"; do
        if [ ! -f "/data/data/com.termux/files/home/.vnc/localhost.$f.pid" ]; then
            vncserver && xfce4-session || echo "Error" && exit 1
        fi
    done
}