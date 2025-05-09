#!/bin/bash

read -p "Do you want to (y)install or (n)remove the proxy settings? " answer

if [[ "$answer" == "n" ]]; then
    echo "Removing proxy settings..."
    unset http_proxy
    unset https_proxy
    unset socks_proxy
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset SOCKS_PROXY

    # Remove from system-wide environment
    sudo sed -i '/http_proxy/d' /etc/environment
    sudo sed -i '/https_proxy/d' /etc/environment
    sudo sed -i '/socks_proxy/d' /etc/environment

    echo "Proxy settings removed."

elif [[ "$answer" == "y" ]]; then
    read -p "Enter HTTP proxy (e.g. http://user:pass@host:port): " http
    read -p "Enter HTTPS proxy (e.g. https://user:pass@host:port): " https
    read -p "Enter SOCKS proxy (e.g. socks5://user:pass@host:port): " socks

    echo "Setting proxy settings..."
    export http_proxy="$http"
    export https_proxy="$https"
    export socks_proxy="$socks"
    export HTTP_PROXY="$http"
    export HTTPS_PROXY="$https"
    export SOCKS_PROXY="$socks"

    # Add to system-wide environment
    echo "http_proxy=\"$http\"" | sudo tee -a /etc/environment
    echo "https_proxy=\"$https\"" | sudo tee -a /etc/environment
    echo "socks_proxy=\"$socks\"" | sudo tee -a /etc/environment

    echo "Proxy settings applied."

else
    echo "Invalid option."
fi
