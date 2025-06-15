# mkcmd - Your 'Make Command' for linux

  mkcmd is a tool to install all kinds of installation files in linux. This makes it easy for the user. And some appliations, even after installed, will have to be opened through typing long commands. Well, not any more.

## Table of contents
- [Table of contents](#table-of-contents)
- [Features](#features)
- [Quick Start](#quick-start)
  - [Installation](#installation)
  - [Usage](#usage)
- [Get in touch with us](#get-in-touch-with-us)
  - [Community](#community)

## Features
- Quickly install an application from various installation files.
- Create custom launch commands for installing applications
- Supported Distros: Currently Debian based distros
- Supported installation file formats: .AppImage

## Quick Start

### Installation

1. Add the package repo to sources list, if you haven't already. (All our packages are in the same repo)
  ```bash
   echo "deb [trusted=yes] https://adekacciorg.github.io/lin-packs ./" | sudo tee /etc/apt/sources.list.d/adekacci.list
   ```
2. Update apt list
```bash
   sudo apt update
   ```
3. Install mkcmd
```bash
   sudo apt install mkcmd
   ```

### Usage
```bash
mkcmd <command_name> <path_to_AppImage_file>
```


## Get in touch with us

### Community
- Telegram Channel: ```@Adekacci``` ([link](https://t.me/adekacci))
- Telegram Group : ```@ChruxGroup``` ([link](https://t.me/chruxGroup))
