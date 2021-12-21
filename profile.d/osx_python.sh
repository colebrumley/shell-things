#!/bin/bash

if is_installed brew; then
    DEFAULT_PYTHON_VERSION=3.10
    add_to_path "${BREW_PREFIX}/opt/python@${DEFAULT_PYTHON_VERSION}/bin"
    add_to_path "${BREW_PREFIX}/opt/python@${DEFAULT_PYTHON_VERSION}/libexec/bin"
    export LDFLAGS="-L${BREW_PREFIX}/opt/python@${DEFAULT_PYTHON_VERSION}/lib"
    export PKG_CONFIG_PATH="${BREW_PREFIX}/opt/python@${DEFAULT_PYTHON_VERSION}/lib/pkgconfig"
fi