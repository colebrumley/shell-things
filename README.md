# shell-things [![CircleCI](https://circleci.com/gh/colebrumley/shell-things.svg?style=svg)](https://circleci.com/gh/colebrumley/shell-things)

A collection of personal shell profiles designed to be portable, modular, and easy to manage across macOS and Linux systems.

## Overview

This repository provides a structured setup for Bash and Zsh environments. The goal is to keep the main `~/.profile` and `~/.zshrc` files minimal, with the bulk of the configuration organized into a `profile.d` directory.

### Structure

*   `profile`: The main profile script, sourced by `~/.profile`. It loads all the scripts in `profile.d`.
*   `zshrc`: The main zsh configuration file, meant to be sourced from `~/.zshrc`. It loads the main `profile`.
*   `profile.d/`: Contains the core configuration scripts.
    *   `*.sh`: Scripts that are loaded for all shells.
    *   `macos/`: Scripts specific to macOS.
    *   `linux/`: Scripts specific to Linux.
    *   `bash/`: Scripts specific to Bash.
    *   `zsh/`: Scripts specific to Zsh.

### How it Works

1.  Your `~/.profile` will source the `profile` file in this repository.
2.  The `profile` script then loads all the scripts in `profile.d` in a specific order:
    1.  Generic `.sh` files in `profile.d/`.
    2.  OS-specific scripts from `profile.d/macos/` or `profile.d/linux/`.
    3.  Shell-specific scripts from `profile.d/bash/` or `profile.d/zsh/`.
4.  If you're using Zsh, your `~/.zshrc` will source this repository's `zshrc` file, which in turn sources the main `profile`.

## Installation

**Warning:** The installation process will create symlinks from your home directory (`~`) to the files in this repository. If you already have `~/.profile`, `~/.zshrc`, or `~/.profile.d`, they will need to be moved or backed up before running `make install`.

```bash
git clone https://github.com/colebrumley/shell-things.git
cd shell-things
make install
```

After installation, you will need to restart your shell or source your `~/.profile` or `~/.zshrc` for the changes to take effect.

## Testing

The scripts are linted with `shellcheck` and tested with `bats`.

```bash
make test
```