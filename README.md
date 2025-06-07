# mkcmd - Your 'Make Command' for linux

  mkcmd is a tool to install all kinds of installation files in linux. This makes it easy for the user. And some appliations, even after installed, will have to be opened through typing long commands. Well, not any more.

## Table of contents
- [Features](#features)
- [Quick Start](#quickstart)
  - [Installation](#installation)
  - [Usage](#usage)
- [Community](#community)

<a name="features" href="#"></a>

## Features
- Quickly install an application from various installation files.
- Create custom launch commands for installing applications
- Supported Distros: Currently Debian based distros
- Supported installation file formats: .AppImage

<a name="quickstart" href="#"></a>

## Quick Start

<a name="installation" href="#"></a>

### Installation

1. Add the package repo to sources list
  ```bash
   echo "deb [trusted=yes] https://raw.githubusercontent.com/falahahmed/mkcmd/main/apt-repo ./" | sudo tee /etc/apt/sources.list.d/mkcmd.list
   ```
2. Update apt list
```bash
   sudo apt update
   ```
3. Install mkcmd
```bash
   sudo apt install mkcmd
   ```

<a name="usage" href="#"></a>

### Usage
```bash
mkcmd <command_name> <path_to_AppImage_file>
```


## Get in touch with us
<a name="community"></a>

### Community
- Telegram Channel: ```@Adekacci``` ([link](https://t.me/adekacci))
- Telegram Group : ```@ChruxGroup``` ([link](https://t.me/chruxGroup))
