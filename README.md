# 🔧 Proxy Auto Setup Scripts

This repository contains two cross-platform scripts for managing system proxy settings:

* `autosetup.sh` — for **Linux**
* `autosetup.bat` — for **Windows**

These scripts allow you to easily install or remove HTTP, HTTPS, and SOCKS proxy settings from your system.

---

## 🚀 Features

* Prompt the user to either **install** or **remove** proxy settings.
* If installing, ask for HTTP, HTTPS, and SOCKS proxy addresses.
* If removing, cleanly remove all related environment or registry keys.
* Designed for **local development** or **quick configuration** in different environments.

---

## 🖥️ Usage

### Linux (`autosetup.sh`)

```
chmod +x autosetup.sh
./autosetup.sh
```

> 💡 Note: This script modifies `/etc/environment` and may require `sudo` access.

### Windows (`autosetup.bat`)

Double-click the `.bat` file or run it from the command line:

```
autosetup.bat
```

> ⚠️ SOCKS proxy is not natively supported system-wide on Windows and will be noted during setup.

---

## ❓ FAQ

* **Do these changes persist after reboot?**
  Yes, on both platforms, the proxy settings are added to persistent system locations (`/etc/environment` on Linux, registry on Windows).

* **Can I set authentication (username/password) in proxies?**
  Yes, you can input them in the format `http://user:pass@host:port`.

---

## 📄 License

MIT License — free to use and modify.
